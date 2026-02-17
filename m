Return-Path: <linux-arm-msm+bounces-93141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE1RBI1WlGm8CwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:52:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C073514B9DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D475301F492
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F4733557E;
	Tue, 17 Feb 2026 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XxwSyCwS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkPAD5AW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98705335553
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329151; cv=none; b=F1kOjY1Pi5BgZmYgW6i25rIoIbGZG07hPnepzLzNOs8Ir2+1U7A6yYbIwkUmtAv1KUxmPs/wXdvV8uvYghNTheH+kH1dQalKJFodFazHweMqvolMVupCQp6rbLFUAwgkWhaU9ORVTL/nL4Y6mAF/gJv3z255cvqGSnJvKdOb75I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329151; c=relaxed/simple;
	bh=dAnsx0xJtEXMX1K0lbG5+T8XtzHHN4M4bEV/iMzg3/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKjIRydStDpS9X5/FNg6IsX+Frp6JTC9OiGIDhUZBt3/F9R1zSzZzv+zWJRlPSwnCVpKcjMso0d1I2NME2te8zEzPiXMgDsiDnNDqMbUG/AGkAe4fRY0gZemLxIEgNztxKG/vwKgq/7sV9rOV/uAJvzmAUG8Grn5iDN0XUR93do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XxwSyCwS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkPAD5AW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAWO1d597252
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N8IDiGrvccwFedf96OqEPLL7
	3MTWDtHz1uUgTvkRpt0=; b=XxwSyCwSVkYg9ZYy3G444Kvs3fLIwD2Apwzfr1TS
	l40/gOPfCCvKAFNbwLBJEDSYI4KuworD2tT4AvwDVijktiTyFPxQ2uKZLcxVAWpi
	U2Ls9dwaqJoBIC69vDJGE3TgfgiPyB/kCFcu/oOLEZUIUSOMFDPlb7rArryh5ntw
	RBH42y0AZADFyTleq0GtDIg5ayvnZLTs0Jkesn0+zIHmMxubKfj5/CP3aMxFRepg
	R9tzGWxfuHaE+NIcT7bVBUR7PbMMcaHgbhly+1pDBfPKUeemXooQisaWOfqYjFzx
	vR/PNipT2zssg8DQHAcg16DkMMfBXoo7ItFKGJCiRKkJFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361nv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:52:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c7166a4643so2614003285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329149; x=1771933949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8IDiGrvccwFedf96OqEPLL73MTWDtHz1uUgTvkRpt0=;
        b=YkPAD5AWX4OSjtoPrX/kvKKpH+JF6JGHQ+uU7oGtZFEDshGnlnUXzDuOp5NbI22JBI
         Vs0E/0iPB8Id2BIWGq/0r/e4Ui2+n6vDYGlyqw4MHFEjdzNhql2My3pSqritqM8iHV6t
         7+One3SWD1ntOL8rlKUl/cj5LKyND8t8KQnCciWAsO1Y0aOPHtFuvMbCRRK0nKYNR9zc
         xcll6/SxvyKRK4GMrfzGCKqOrlPXC0111FnErc/WRcmlfzD4z4/b11+BF49Q+P5GgbUw
         KerXwiG68gjIlabBiRzg0XxAo0IfIraUvFt0n2HqmqYbp+J1nOhYjW+VxQ3GT/n7wJF2
         o6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329149; x=1771933949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8IDiGrvccwFedf96OqEPLL73MTWDtHz1uUgTvkRpt0=;
        b=nlutI5tdPf2s8i1skjifNRT5pSsXbQd1dV1E1NLm/jWsdPd+MriMkaAEDwpGol2eAR
         cGE3vCAnnsctwI436PaG4eTv9zWnPdvEAsZyIzrvgiDB5fmS4JmY79QOD67MguOAesZN
         tQfl7fhYpuQ9ZzcIkuyuU8u7I5ABKhaPpRgL28MirxLfC93Q31pGqUFUD8wBJkKckqnm
         z3ozFHBdqE8qPNpzrwKcbzvTtkL+3kd0nAIUPgkLiz3HDpvc+QSEvb5WihBgN7ynWBbx
         HQyhTdklHKHOs3+aqUWpY4QHEihfYPZA6JLTChBXWy3lh4liRtqvNyUGBlNr3x3LcxjA
         PP3A==
X-Forwarded-Encrypted: i=1; AJvYcCX3b4a+xVFp9ESyAx/j42pCe/03fR+BMWsKQs1Q3R+vdUoJWO3YylhALVSXXANsiZYehZ8C2dILXroS116T@vger.kernel.org
X-Gm-Message-State: AOJu0YyOUCp1creEKMAYUhHtPv+1Xo21iOhy5Sv2VAVB0SrXQqntt7Ck
	oGBJe/IS6ITMDUrqnkWUoXQJRMk5DGPibI8oWvq6w8oBeshify4ufzhmRuk9sCgk6OnUhUCLr1k
	u2mNTPIi8kco6KxVRDmIKo92bOynNXUXsJRDmpmX8WboIuFFHJd/ZCDowmt+fpJSDpidR
X-Gm-Gg: AZuq6aImcqJti+7CSjiRd+pTvJ15J1pdbKILc9l1sig6AGDyorWkOL9694DwK9kpqdw
	fWvFdL2aQWXkiGjGzkLsGACR2bX0/tJBbetzGCARiUNvFysflI1bXZUSdonqiqlwVIqyxJid77l
	vtdzFx5wjJsrgO0FEzdlkyqXxxK4KtY1blqm0KAH0Pm4ld9p3X9EqyBFkxPXg4Bt64Igyr9y/Ae
	McvSl3H7RDNPKYgZrivDPPcLjlvv1f68KG2Ng2Z6DCCZjojLRWXSr+yhvO2aP/rjGqJhF7jgYOK
	pDvFtuSlWR/7ua/x9SHhrzvb75AkTFq5x5+JZyk2yt2zBYdJKqy75X3FE0nRcwIWc4TPI1ptJjN
	18W7+/5GW0a5I1wSFEG8hjWmzmz6aqauuyR8g
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id af79cd13be357-8cb4224b5bfmr1439782985a.4.1771329149002;
        Tue, 17 Feb 2026 03:52:29 -0800 (PST)
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id af79cd13be357-8cb4224b5bfmr1439779785a.4.1771329148403;
        Tue, 17 Feb 2026 03:52:28 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d92267bsm769676135e9.0.2026.02.17.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:52:27 -0800 (PST)
Date: Tue, 17 Feb 2026 13:52:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 8/8] arm64: defconfig: Remove CONFIG_SM_TCSRCC_8750
Message-ID: <nlx3bt7uchvloqs5kutrtxawq4auorptpp2egjz4wrtepx5zrb@yoxmohxefwgy>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-8-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-8-cd7e6648c64f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfX8IwHHiUi6JJf
 vhwXidEeaK9/bYWujFSxFxUrbG81GUK10WzLzkI/kO2zr7HbeF++JCH+EkA7qXE/pKWxym/r53i
 HJyfd09fogRKbhsFS17V/ndizM/jEfhDQmkpk70k351v9efNiD/IcwU6U8gFxr+qQMAcYUWwswR
 Yx7ohlNrRxU8pdxTfC3zc8SpYmfkZDC7x4uThM/s9pUix233tgE1v3nyHLt4caOs10jXussBInl
 ymtTNr0bPhsOKD7qMuqidjEyL9L6nH4uxwv4DkuiBqYTOG4G8lvsahiW0bFTn66rWSGaD1vqvwO
 mKc4fIQgHVX14aVSsLbHokp62wWCbb/k96z7bzCCE+e0MeBizccq79a2fObGc3Hhq1jZrWGHbZU
 zwkMFdvf6oKBhCVsdNkoHyAQ+mP9lUIK8BmrAUFs8wdBtOYjHzGRZbNFa8nX0Y1n63vi1iHAaFQ
 8ahyACW/RNyAj6ytHig==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=6994567d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=DpAI_w27UE3fYZUDY1kA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7getMSmeJrOoQRcXm7qKOYoUerhlVgP9
X-Proofpoint-ORIG-GUID: 7getMSmeJrOoQRcXm7qKOYoUerhlVgP9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170098
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
	TAGGED_FROM(0.00)[bounces-93141-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: C073514B9DA
X-Rspamd-Action: no action

On 26-02-02 15:57:40, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The driver and the config option have been removed. Clean it up.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

