Return-Path: <linux-arm-msm+bounces-90681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCPNAJ6GeGk/qwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:34:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE6491C8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 457C53008760
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DD42E06EA;
	Tue, 27 Jan 2026 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgnWoRMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUYhv25x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5AB2E041D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769506311; cv=none; b=CPmWddDrZE/5p9K4Q8RIC9ofPOfU4+coKBdIR06V9cdHfuz0J3uZGVSd2XN/Vlt+R4D7AtBU+piGFf9Rc3NKfquudzp5TmK90n31xUEMs0Z2K4IrPUXB1yimv79qV1xV70Hgu26J2Fb2oSbEIRyNa1thKlLOvNv8NPlZXLW8JZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769506311; c=relaxed/simple;
	bh=h3npmff8M3XFVgZvC0hZB5CpQpsvBhOspR9SPG5vZDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HupNaQ0lu2bupEZA5FNS4AK+4GqDKF2X5URXb/vvAKX/WOEpWXkIpPaV0QbATe5I5doGabeR+g8DsIwo7QSC7291mp3COBknWCtrNQl810m13fzmhoJtKsI8DA4HezT5unur+bn1xzB53iQNKD5nMw5QiFc9orSPZI9xJV1tLAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgnWoRMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IUYhv25x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R87JL42379244
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vmDHSjdW7r6E7Cs4UyeHIlulePC82WTKEubnvNqm1pQ=; b=SgnWoRMRvVSMjGBe
	RoOBDfg2DPpU9kkIePFGNC7fu1OZyy+eYAG0cC8z/N5r4JDJllZ8PJT3Ljep0rWL
	siPLP/DIRrMS4S5PpWPXeYkVZU1rqDD8y51xNs7MC//yg1227f+WYKxLvbKevB6P
	Y1s/XD2y18N7pAK/MN3VDZnNgB4zSlHVuoet4nb9GI+esrnhx6ozl5wTfj9/C8wJ
	NnFBjQ7HauaL2VlFq6LdH7Xe0OaOtXGvmP5gm88IEOBo/lr7wjuZNOXC31qZiKrz
	6xXLX6/3EyK4iRHNJ0RtpAJHizqQsZz5D6dcWw7ocIPOrWu3bZ6zuRN6T31HudQ9
	OelYNQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjr89gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:31:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a08cbeb87eso56098935ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769506308; x=1770111108; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vmDHSjdW7r6E7Cs4UyeHIlulePC82WTKEubnvNqm1pQ=;
        b=IUYhv25xJS7rtfbf5OjI8b0CqwCotbr9Wy361XaidDXj4vb9Rz2HMhjx2soALtE1kq
         WrRbdH/HWMkHA9xCI7zKyj9wOdejySUzzKuE2WetyvH6CZLBzFY+J0pyjGmF2W7Abfza
         8wmUHaFw1m2FuPN5NHvpTO7DMXFpBSaBNo+8svk73BhD2kyFRIb/Y42Bzx3H9H7YCv7R
         mG33mce9n4Qhvh3ZNusiVWWIXvrvVRIS/nNm516nifYuJGryi87RG0douZjZMkxUJVeR
         r6IO0fRDLt8JdEu20BNM3OMFWxHb/FHF5hSgOEL51stXklKnbYbc6DPGmIZ1gDzPWTs/
         d5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769506308; x=1770111108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmDHSjdW7r6E7Cs4UyeHIlulePC82WTKEubnvNqm1pQ=;
        b=lc6ChdKI1/fuTlkWyJFpCzHfhAT8sLtSi+47pEfGIrn/j3yv7wsSLk/Mg8jkxKkrJp
         2/wWVIM2LS0nns86N7QVJEhiRp2XJjsKr4uhcUdqNYPUvb7m+HqUQoarIQjEyPbQ75/1
         rRl+lNuK0R0RTa5fVGkcAchw/12MTrwSQOE1jVhW00vlvuCRfuKqAUKrM3emD+7WmlQg
         dJLJkISH6x1h0/g5dCkaxsHUp/HLkwSMWi3Ig4ED0GFO4bCGwlg/q1f06SF99MD55Smz
         LmDTbQZ+IXyfPSa8w8BLMxOlm0V4BVBEFZhfRqm7wbk+sDI39iE1l9dOmP/xjA8XZG4P
         efdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2TN3AsAHhGwip9Nz7dy2aZhxbEL3Igk+3KjA4hOPk9vqizgnaa6q8WguwAURWvmZNTRQ5qaFV95g0VymK@vger.kernel.org
X-Gm-Message-State: AOJu0YzY15AAVLEFu6FDB0LvRnic5Htv8raSuJAm5wEXa5T8xk+J6t4R
	7ff8aiveDVIUEW4RLnFSfLbLEWguev1nkz1UIFUfjXqCcCu3N72Y4ptdv5HpKVoXsYLdvIOKt7t
	B3UXwFlJK8wsgOqymwtjUuLhGhOD3ZEzQnwWNb1Tj4aFCrVMOJC/LV3BAs1c4xLAL68Ot
X-Gm-Gg: AZuq6aIym/ZXX6tVzk7hmGZob0bNkCd3s2SeXT0PVz5znL8l6Uo85zt+55HBKSdrIry
	DW4d5FZAXyw9/OeH1wdprpcNsg09XkAaCWFa/wUS/ddtCVv+j+y/nCw15l3tuhhA7zBh/OAu+cQ
	4D5fhOR0efcAwyJHeGpnJb5dPPtCbqAuKxtO2ZfRL8kXxkLQaQb9wnGdY4O9W4pbr4RN2/nuidJ
	0reH7ARCJUp6akuu7bOCtdciCpzBmX5SQJTITpxPg+ZLLBKV1mdi4Vzar2lm66Lnh7rSE//V08m
	ckptFrQedtd5CKip8qVadxEbX3Clm8O1OlCbMkw4flpcg6AEvDU2S1V9kRYCc2vx/eUEY9oCdEs
	mU933afHkF7jMZg8oGPmNpbtwVQdV1GJpKKUasmIexhzK2So=
X-Received: by 2002:a17:903:1aae:b0:2a8:7814:47ce with SMTP id d9443c01a7336-2a8781449cfmr6915405ad.23.1769506308043;
        Tue, 27 Jan 2026 01:31:48 -0800 (PST)
X-Received: by 2002:a17:903:1aae:b0:2a8:7814:47ce with SMTP id d9443c01a7336-2a8781449cfmr6915135ad.23.1769506307531;
        Tue, 27 Jan 2026 01:31:47 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd4e8sm112566615ad.99.2026.01.27.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:31:46 -0800 (PST)
Date: Tue, 27 Jan 2026 15:01:41 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Enable ICE clock scaling
Message-ID: <aXiF/W1IooozQlV9@hu-arakshit-hyd.qualcomm.com>
References: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
 <cb6g64efyoauel34hsckp3kwfprw7etag3fthqlkucz4ue5ytf@t4gejdalvvow>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb6g64efyoauel34hsckp3kwfprw7etag3fthqlkucz4ue5ytf@t4gejdalvvow>
X-Proofpoint-GUID: 5spJUb_x50G_t1SmxBQw3P8-MRDrq3Fo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3NyBTYWx0ZWRfX0UVfTe1R1bf3
 uawxqjQNVNNbApJoQWAJila+om44QXc9IhZydZy0sUIRTYEasPoa0vyX6jXeVj8qfk4O12c/chf
 5lB17qkK/dXSXSp7YyhYJZVfPfFJBXpAH1PjWSRlzgAM1pMvwZKhGN6FD3SqRZKnmLNv+QODkdQ
 rViJgEWLH6tBkerx5MLvljMxj4BfNyhy+KkY29BbNDhSwMvjO53h/mz6stVwojkqp7SlUyVLoIW
 EqKLyNJNxAzKx/S+/ZmFgnd4XRbpwq0yA/6zhR7YGo1TIuGL3wznow0bsQ05BIKn/Rx+oLnLcRu
 /OFnJebnu6plbSeW5eHQ1MdhDLXokzT9OyFbIP+CEKLfPJFFvZjBdQ1Oj+9l4AVd5WJgGgXASGQ
 ZNUJhXIZThQ4fY7SuJyn1FwuI7F/mF93A7cxNUAiNYldvKERxS5yOO222+EhfHjwEzLrXrLJIY1
 qBJspH+HJDrrORsnT1w==
X-Authority-Analysis: v=2.4 cv=b+i/I9Gx c=1 sm=1 tr=0 ts=69788604 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=A3LgJq9kZUdRc3Vt2WcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 5spJUb_x50G_t1SmxBQw3P8-MRDrq3Fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90681-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EE6491C8F
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 09:18:36PM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 23, 2026 at 12:42:11PM +0530, Abhinaba Rakshit wrote:
> > Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> > using the OPP framework. During ICE device probe, the driver now attempts to
> > parse an optional OPP table from the ICE-specific device tree node to
> > determine minimum and maximum supported frequencies for DVFS-aware operations.
> > API qcom_ice_scale_clk is exposed by ICE driver and is invoked by UFS host
> > controller driver in response to clock scaling requests, ensuring coordination
> > between ICE and host controller.
> > 
> > For MMC controllers that do not support clock scaling, the ICE clock frequency
> > is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> > consistent operation.
> > 
> > Dynamic clock scaling based on OPP tables enables better power-performance
> > trade-offs. By adjusting ICE clock frequencies according to workload and power
> > constraints, the system can achieve higher throughput when needed and
> > reduce power consumption during idle or low-load conditions.
> > 
> > The OPP table remains optional, absence of the table will not cause
> > probe failure. However, in the absence of an OPP table, ICE clocks will
> > remain at their default rates, which may limit performance under
> > high-load scenarios or prevent performance optimizations during idle periods.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Avoid clock scaling in case of legacy bindings as suggested.
> > - Use of_device_is_compatible to distinguish between legacy and non-legacy bindings.
> > - Link to v2: https://lore.kernel.org/r/20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Use OPP-table instead of freq-table-hz for clock scaling.
> > - Enable clock scaling for legacy targets as well, by fetching frequencies from storage opp-table.
> > - Introduce has_opp variable in qcom_ice structure to keep track, if ICE instance has dedicated OPP-table registered.
> > - Combined the changes for patch-series <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com> as suggested.
> > - Link to v1: https://lore.kernel.org/r/20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com
> > 
> > ---
> > Abhinaba Rakshit (3):
> 
> DT binding changes should be a part of the same series.

Sure, will bring the dt-bindings change to this patchseries.


