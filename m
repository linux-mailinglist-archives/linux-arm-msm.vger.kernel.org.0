Return-Path: <linux-arm-msm+bounces-93150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONrtE3VZlGkXDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:05:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAED14BC06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CBD2301BEF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7403382C2;
	Tue, 17 Feb 2026 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2od4Spr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWBuoyIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25F3370E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329904; cv=none; b=JQuGQ1xVSa4H/bwTXttbjbZyvp5bhJu8XzJDNCWro3Y9IDygbfLJTJ8/XpeOnlpHKfSXFlTIBWoD3i9zlzFC9OohnW0i3xpa9ve68AERcIQdbnJPobqOQJHXeaEtj3pTy50q6T5RsDeG6ktBfQN9psbuLNHqBESxgVwP7swAHAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329904; c=relaxed/simple;
	bh=aVUGa3RY796+baDvlhpqGowjESPg44gTPp21C56l+gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTQtEu9mlPagx0NuNmOCv/qLVMLnWuaedrqzCIgITwTooge7KQTsD1QkohvJwLw+lWmYDzUPStkEyNe11J54ZqvcNDRaTLq7khJSxye9G/sKVI11qy+pjnSzxXxiWP0nweXCklu+SmjcPM7r8q3iZjPE4GSSeV/uOyCq358Ej2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2od4Spr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWBuoyIk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBBb2m1410854
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WN5A1Uh8FQbkVezplAg2+KPH
	LHpsIMxAUayv8oRBN0g=; b=Q2od4Spr7BKqk1uarSY+TBtIpKjNszSwilu9idhj
	WP9wPjOmr8vnvvA4VBNF55S3+B8ro8frtgHzTFMrqkuIFdhsTddPJOcureeoTSf2
	YeW8gJ5EchSqPxZcLYs57L7K/vEImRd9gR+Z+wVGVtBsYMHe8l1Akt5CgpH8tj2q
	GBZkICyotCFzOe/HQODrfJl3rS0Qfj26Vs1ooTwCX5HSZkLuqW/yd2gtgmLXlOpg
	hKGdf14Wofv/S6R5NAbh8A1Fkj4YQ3LD086SU2UaxucLb+WUF9RrEL0rycLy/Rj5
	+EHZPNx3V2cpE44ijH299VrAmwc/2MYP4VjvMMD4n9/Rtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap24k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb413d0002so2697802885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329902; x=1771934702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WN5A1Uh8FQbkVezplAg2+KPHLHpsIMxAUayv8oRBN0g=;
        b=YWBuoyIkPvix1p9CnDQdgau5CaG9As8WmcU49uXe1YZ7m+5asoyiWEu4BnMUj8XRku
         qNXgyuevUS6sDV4tekC7sgXUjICUYbpwKhLubvNd/Za8MRMW5bBUhVAHPCBBqfCHpBaJ
         whKz5zySdd6RtfuQMhGF9rdDhoZ/6PKy+QChGIBQWFPo6lIiljVtK8QV9BGnRP8205/C
         nAbOgwWX/zqWykDSTzXues7nvQLTMizZBjvU8yN3dMVA2okWplwBgO0sKs89O2XvGqgC
         TV3+k0SfY7Qh3YqrNxj3GUy7zB1a/ZFwUGZ84idec9WyAOwF8puqlG8hlEhSXL+bDMA5
         WScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329902; x=1771934702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN5A1Uh8FQbkVezplAg2+KPHLHpsIMxAUayv8oRBN0g=;
        b=Ue2Syvbcc9MfL7JbBlvPAgee92Wy860CJl0KzWW96GgTmw92AAnbNzd0czflWUppxE
         z6bT12AViEeQXbVQYEikUDbYNpjh7EW1vwUYHmgfde0nQrWaEO4XXu8WYII7OSTESTGS
         jueA3S7e88DWS4OFOFkt/uZqbN/YvrcPH5cw7aXPf7HRcAEOtDEPd2XtqCznfvJo/zWp
         E8U4Zlv2sxO31KiD0qNXRuy/+x46R7bseZiM5a3G9gtp3BPD6tM1Q2foGbszefxPv/6Y
         +AcpENNxZKpxccMeWbVx01RB9m4IFfYnT6Bzp0NKQqy+t9Kf6t5I4GAnyMFosTuUS0O7
         iUbg==
X-Forwarded-Encrypted: i=1; AJvYcCV5SQr9gUPEqPQlV7c64Iv42SAZIRp57NWGSfHjI8cQLQ2SjYvG8wt/BU0BtBKHqvjLhjFSm+s9vZTrGU4d@vger.kernel.org
X-Gm-Message-State: AOJu0YwpH0/yEwinmlUsINF0TWB+MOlNNm7mnmKrsQa6zFzLfdW3P6tx
	q4B1+LNhU1vkrWZLEr0Wwv3Q5jjYatw6HAhigzmAwiPtgWwFyfxnbE/ETYx6Ho2MuH28zzRyoi0
	ul9MtKW0qvdCXNyP39DqpviJPRrEzcoGkD+bY+LrERWEDFBkrCesqoZJnC5GN55g8/3NrMWaGzf
	gS
X-Gm-Gg: AZuq6aL75qJ71KjV/PzxGYojF83r/LHAX4/ywmeUeLy0C8zE1IQsDKdP0jWZDBoiveV
	SWAmS0OCcdkww5m2o7EW4ElPExjQm6ooST4b47tjzKji2TPJxwEZcY0pXUN6pfS72BvdnvRL0yQ
	+GwJ+SGkhjtH2xQz0W26Sp9/DfZMudHQ2Sf/pEnKuOn0b4XaAsid0vyh8okSyAnfiR2ZBiXudpx
	93r4aVp3dKLTytWTQM7h3AJzxpLsDAoUA5OcPXmc0Xvg/TRYQr4inZVq5nN8jzpPG/o1mQyF32Z
	lCxvIzrPG3JiL8nA3L56G3s1pOqphVsbMSyfNpPogTINLvpj204u38GL0os1Gjk/M1gt0UPy+eX
	jNuPy/m5WWoK5/Z5lBNl1E0W/GPCStxwTdc6v
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr1242525985a.15.1771329901914;
        Tue, 17 Feb 2026 04:05:01 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr1242520585a.15.1771329901366;
        Tue, 17 Feb 2026 04:05:01 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm34676995f8f.26.2026.02.17.04.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:05:00 -0800 (PST)
Date: Tue, 17 Feb 2026 14:04:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH RFC 6/8] clk: qcom: Remove tcsrcc-sm8750
Message-ID: <gazyoguari56n6t6eaxbfvgv6hsc5jaqtfkhlshkbijsilfuys@cggmczqpzbq2>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-6-cd7e6648c64f@oss.qualcomm.com>
 <sxjrbxwi64ky6dcntpnnbi3y5ujtssz7uno22xiwiqjdhp7rxi@b2nsnmb74vnb>
 <270589cf-383c-4062-baad-d232f7eef3d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <270589cf-383c-4062-baad-d232f7eef3d5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX+abxxj2lkxvd
 PjFSlHQjRcGuj1WvtiFWhrEgZk6PxS2y3+xaHfYP7TyaEzUh5GhQHc9uk0QaKFxkwCXX0cu+217
 HkXyGF2DRSZBMRhPsqkXcbeGZvDxAGc+SPEjPpeBGv1zO14QXFHboc8NPKQmek9D7HEHyzunEry
 9irvCWHfNjudakgg8/+a8Vqc5Ldvxq05gW4YwzDSjB+LMBMhPwVxKyB2m0BEtLetmPHGUTxVtol
 WwsRHK3sCjksT9y/K9lhvHXkVYU+Re2R4hR6MVFpJYXwUtwTOd1Ea8oU+q34Grgmp/h/zZdq0mo
 hv6uHFXMmPW41tcNgM3mEdf4rWYVh1aYo7jw24p7Njbx+KcuhVkrsptVTV5FJgoqFtXQyr1h1hB
 EQ95sqFbKBOtai8Wh6osptkdi+62CL+Moa1jyFYhipxJrqBGRBG5aTxfBcvM7XnsA3PaIz6ucEv
 gG53hg62Y3uD+9imzaA==
X-Proofpoint-ORIG-GUID: wTYxzBsKg-yymxXqUa12UpPM7PFVg1XW
X-Proofpoint-GUID: wTYxzBsKg-yymxXqUa12UpPM7PFVg1XW
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=6994596f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=OsKXUHKqkhwHkHYPZh4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93150-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCAED14BC06
X-Rspamd-Action: no action

On 26-02-17 12:50:50, Konrad Dybcio wrote:
> On 2/17/26 12:48 PM, Abel Vesa wrote:
> > On 26-02-02 15:57:38, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> This is now handled from within the pinctrl subsystem, since there is
> >> no "CC" block inside SM8750's TCSR, as the corresponding hardware is
> >> present within TLMM. Remove the leftovers.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > So bindings remain in then...
> 
> Yes, to limit the explosiveness I decided to reuse the existing
> ones.. I think that's the reasonable way to go

Yeah, realized that after having another look.

Good work.

