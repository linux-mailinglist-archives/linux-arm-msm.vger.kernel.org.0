Return-Path: <linux-arm-msm+bounces-96058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGHfEPWOrWmP4QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:00:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C716230D0E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5841D300E717
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 14:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F90285C85;
	Sun,  8 Mar 2026 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQbmS2Ou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atIN2Wrq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0410275861
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772981998; cv=none; b=umeYtSxzDRDr9pPQjWzc/MJ0Yq4MVlmZSckJPA9GayRoJXcqwqTEgsQIAUKjNskYu2J8dj2XnZiFhI4sOSxJGXkmLjGeRsszQ82mr0SAuMKlhGi8PzeMdXQVqpMxqPEot4+H1XuoWNq6iwTvUy3vpIG38+ruof65fayRluuCTc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772981998; c=relaxed/simple;
	bh=sIkLRWshfsUzl8k0tTWsf3IBRozXflOceJthOMuh7AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLeli0Tbnr1lGn+U0tw8R2mNtcBQ27xL+8ZjGi1nIRqEhWb4mxOUob5frGuPNIxYyY82isvPETsTf6ZU3V0HCWsYxGhUVpg+9eELdT6pEyc+TfG+dFvjaJEYDeZSvEdTZXeCm5iGidQ9NMYSfhP5MiHMeSin+OYBirw9ku2bQk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQbmS2Ou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atIN2Wrq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6283Ngra329089
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 14:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hsTDb6XVP6BJ/4sIkucYFt3d
	hMd9/kDY/q5PRt6auHY=; b=eQbmS2OuaiWCm+O74rdiHpcTrqTrxvjJZHarUNU8
	4R9EDj4+crmUxmPf0yjjcn1anEDW1Tpx2Zl2vPr/MThF6Ll7s76IOK93SPIfeqL6
	MZ3hsTbk37SQRZwtYt0wT4aN06AZDde5ibBxz5FfV6C0MfGPsWSdpzvBuzqzAIQ1
	uj2H1q/aFYlWYmC/MCRm7gUp0Wg4JM8Fyvr+rdmpxW7D1EhujofpPk5CnMcM87d7
	/WwhXw0vXg7brinSQnAoZeMB14Aj27O0h9wmUeSD0RuXova0KJOb82afYr88Z7/1
	hgXF73ma5iD8ZRX1nDGUKah0rrBUikjbIG9gvvs25cSw6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpk11e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 14:59:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7ea0bb20so427698285a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 07:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772981995; x=1773586795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hsTDb6XVP6BJ/4sIkucYFt3dhMd9/kDY/q5PRt6auHY=;
        b=atIN2Wrqs9h2ZlzY4xAixeEJk50P+rGaB9BTdkKfkerhfipLzGSRJrgmRfwKqMhtJp
         quaAq0P2hF4vNCJxdECeCxdOs/P54xq/2U0HWXnHnBGWJbGouhclk0OxWa2HIKV2FNpL
         irKG67VYuRMaysouVRDT9F4HnhUFZrK4WCHYrWosAYf0Dgnxk7S/QX1qMPA6JVlUkbCt
         NGYvCC2/vIHDLf334dfK2hnY5Z+tlG8GPxQFMHwGOUr53DisskgSzYZDjJp93/7m+h0k
         lWWANom/8mT0PXoWNldv+jxmWeA6rwp96hSYW6MpwQgjSv0zba3zb0kOY8eplRuhRw5+
         nomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772981995; x=1773586795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsTDb6XVP6BJ/4sIkucYFt3dhMd9/kDY/q5PRt6auHY=;
        b=arx2FZ/UOBUlQ5en1oivepxdvhTDRjqsMwM5AsjStAelC3CBbhXnX8GSQXETA39Vqm
         GCGxhSwms4CwmZPczlTbtOOc5TEI0WbeCLIYlnDUP/ZVwsXIjEuriIHRpccKg9AK60ay
         3qgHJGqIm2z9U4vGtB9qjDrx5D30t5HES+TEiRBx0IkY3OvOZUwBYaao2Uk3dbtBRS+i
         Mou6Eo9lkjaYPODxXhcHih+000le6QKQheBzSZsxNF/LE3GhEL08LUQXi688Tanw1ha5
         Y881TQfPY6Jj71FQnTd19f7VyF1m1t8NSYnoUV6r1ZhnUdRxBDU14TZ1DrqJ/SgZJTaL
         Z7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsn5r22QHiMnoX6yPOeBBREyra9H0hsAe7IVAP70YsAcQyAa2iFVEajFDE472yXF5Erh3o02XIuVwi/K2a@vger.kernel.org
X-Gm-Message-State: AOJu0YwveiUMFwRXfZNLv1CdSB+J7OEF9UrkdABkomZfKL1U8NRgxTqp
	M6bD219tfOQbpZJtRFrI3yE9bqhz4+bylPJ91MxJy568XIGea6yknrcpqCEEQ2dLJclJ06mFObg
	Q/xPCBDot8MrJil4s3+/UcZ6P7ENzZzjltx5jyTneVuSzsvVa2daGlyf3tLBmXGaQwd9MhlYgMR
	VR
X-Gm-Gg: ATEYQzzST1Z5pg/SCUR0JKQ5OpV2UIaMThAbSzyGsrxxTnpimJ//4GS+O1USu2EU0wD
	t+Au2MH9ryPxIZ6uKTESYhyuoXi3OVHYl/SqVLoz5CD+kSMon9KQcpeCSN5HDNky+QLHLIpoXUS
	UiQorcMdMOHKtgpIY3UTxX5NsBPeQwmRw4H9eYM2qdC0+DEiGXRNzH8NQJM80iIklbtxoJRpcD5
	/YaQ7NYUwtl45bOPNbCyoIsVxvJY75jYy/X8kr2l/7wa25KpPE+xra4VlFIKMQwDdlpHtUpDq1u
	F4vxtg6tZY+aPQfX7+NTvLA7PWt6Lq6X7l2yPh84kxeGsJR4IXG4vaFPymskpO/5EZK6uuYnlGa
	Qu8cT3ICUtXx6LsUK5b/6r1RzNvComUO84zLkHvA7NJPmlmHeoub1dQ+LuQ7bmF/qYgG1tHBp2a
	VCRQKCYH8tS0TGxpgZ0WUTR8107JbwpTcjKsA=
X-Received: by 2002:a05:620a:198a:b0:8ca:d5cb:6835 with SMTP id af79cd13be357-8cd6d4fb0f9mr1022613285a.48.1772981994733;
        Sun, 08 Mar 2026 07:59:54 -0700 (PDT)
X-Received: by 2002:a05:620a:198a:b0:8ca:d5cb:6835 with SMTP id af79cd13be357-8cd6d4fb0f9mr1022610085a.48.1772981994160;
        Sun, 08 Mar 2026 07:59:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cd9csm1509063e87.1.2026.03.08.07.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 07:59:52 -0700 (PDT)
Date: Sun, 8 Mar 2026 16:59:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add label for reserved-memory
 node
Message-ID: <cifklloa2hp6yt7o6kphjydq2mkpqs23avyqa22tsrf5xjsw6v@cgkvft5nossn>
References: <20260308-sm8250-reserved-mem-v1-1-889eca3c11ca@pm.me>
 <2b260d55-71cd-442f-bf9f-a9771a2765c7@kernel.org>
 <yyLvPClplHmyd72RJgOMXVLx_z6GT8sDZP8FyzlHMV7MrCm26twtNmxebCmLwusqGABJQTrIIAe-AAwAW3uaIQ8Rw5TId1C4v5reyj71nmU=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yyLvPClplHmyd72RJgOMXVLx_z6GT8sDZP8FyzlHMV7MrCm26twtNmxebCmLwusqGABJQTrIIAe-AAwAW3uaIQ8Rw5TId1C4v5reyj71nmU=@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOCBTYWx0ZWRfXyRKQ599IAH4B
 BiPWevtPXLioag/4tXD8wDDi6/IIyCbGiSjCxdGbZR+ka5wgQaWA8O8YZw4HznHHJZBbqrSEbp0
 oYBDF5HOAUym6U6/y4h4pluz91Hu5bqKD21fjOtx6jFPl6aixzMaSYYLs7YnFlx1aadvTcbdEto
 fUh8IK8Wn2+t1b2BEFNPtObcFcoMZ7ykqhCvOm+4aKlCd4iCsz9kV+5h5waKmqtYdEierJkwDGR
 XZV6JQOW6FlDOl2vrNCTd5rf8TYopwumVcIBETbVDl+VAXwEBnydc0wiwMrFZztpF+E9Aujl+Hu
 dTlkGThILvq5rXO9zQ6gpB0z7CXsltAoDU4xROy+Prx4+bQBHOEcBLvqoHLlfzRcA88ovPXOB5R
 yZkzGMHBSJdR9o+koYhMRdYjddkmtlGuFy1gLt4sO8Fm8WT/r85m4ZXrTnJBlVU/zHRiGOUZzIA
 dXDuVBivkET/9PQi+9A==
X-Proofpoint-ORIG-GUID: b6wLS5CLdkbCvcAG1bEm2EsOuNIXdLuB
X-Proofpoint-GUID: b6wLS5CLdkbCvcAG1bEm2EsOuNIXdLuB
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ad8eeb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=fgW2vCsinbKONiUGdKUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080138
X-Rspamd-Queue-Id: 9C716230D0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96058-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 11:52:07AM +0000, Alexander Koskovich wrote:
> On Sunday, March 8th, 2026 at 4:46 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > There is no user for this, so change is pointless. labels do not exist
> > in DTBs, so drop the entire patch or provide here - in the same commit -
> > proper user.
> 
> Want to submit the ROG 3 in a follow up change but was trying to get
> all dependencies for it merged beforehand.
> 
> Should I just upload the devicetree and link to relevant patches?

It might be eaiser to submit DT with all DT dependencies in a single
series. Then the reviewers can see the reasons for your changes
and provide a more complete review.

> 
> > 
> > Best regards,
> > Krzysztof
> > 
> >

-- 
With best wishes
Dmitry

