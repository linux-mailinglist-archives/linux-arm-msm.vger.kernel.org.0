Return-Path: <linux-arm-msm+bounces-110529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLuUH2xGHWpbXwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:44:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1738361BACD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4600E3028457
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 08:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D856273D6D;
	Mon,  1 Jun 2026 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bj4DKF8n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+2ssdFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD4234C98C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303280; cv=none; b=Uvi9F2x61E1hjhwJVvtx9T5xSqPwuT9b9Etd1MHEVktjk6XzQH+mjV2ejl13F3JUgU5whN7xEtgY84OYuVouFVBW5FCSDSra7JuXjMP97abDGb7cwGRBiXyUdbJg1N01XMwKr/1/lUWZNriwRL087JJ3kHgqqMpH0Al8gQ9FR6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303280; c=relaxed/simple;
	bh=S/hLZ1FOgth+2vljeM9PnlmEtnZOHtgGGQQ9sMQ9iBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+NSs8Iv6PzfXxfB+jBjeAxRfOJSTQFgaPLk9Py5qWyJmRyAh0FGLagxT39QGjfS8OI22EFDJVewJKn+HIVbTAVq9D+AnyM2W2NGJsIOZNAXwnUm8IrVqT+c7vAcw1yfC7l1M17SszyD6PuajXUu7aazjk0/I8+ykmu7Vcbsa3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bj4DKF8n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+2ssdFW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518e8XO1214113
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 08:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rK7ulaq5hmgd4bp9elL0rBcp
	iMNXXRsQzs56XiD2wNo=; b=bj4DKF8nm35xqZMtM69SENSPEA4hd/YQ5aODHGr2
	2dV2QoMoJMxme9Fxu/uHOqvvRf8zYT9uHajUYoaUyRqcevt0JLgg+MRO4cz1z7xI
	mytnQ4bwkVJJ9drWi37wnoRwBa9Lq1WwLFe6kjFIplLg9hXsButgfEIrb/ozWRnl
	WUig00T7TqE1wXWnJAhS8L/mKiDjIcjPUd17CJlpKK184R6FcyTHe45KYEHr1Tpb
	kymSdY22yJJffZvZORZXjKuPxeN3qVbXEaLABLcx70ujSQ0FhzWkvmpf7OirzISA
	wPquvmOAcjrAsJyj6SbQM0fBjt1rUwE8YQm1rwe73L05XQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6s9805f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 08:41:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf55c3f44aso16042395ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780303278; x=1780908078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rK7ulaq5hmgd4bp9elL0rBcpiMNXXRsQzs56XiD2wNo=;
        b=a+2ssdFWxu5azHxzCjonurwyNEN2TpmWQShdBSfdKCwh43KZLodCmjIi8NMNrTH6Cv
         nIrPwouW7EU7NBQ/wZOtWoW3qq4rTaxZ3jVInUE373zyDyA9DiQVERHkxRsDZ2k3vxXl
         G2yN8vVeRCbg5fXOUdRqpqsxHrFLlKIOI9GfsKxqVz4W6TA+jAlQOxkYdPPCeuPsZvJC
         yYkaK6tqVuhUfeitmZCIAtx4xqWpGMmKaPTSJu996NWtLdKmqzIEVdK83aTo0vhEuiOa
         s0wQzNdYy/bjuWBC2/9ZLGRvd8014Q58Eat1oYYfoUSDhg0ZJWwFjqHh/Hd8xIAvGsWU
         Y88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303278; x=1780908078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rK7ulaq5hmgd4bp9elL0rBcpiMNXXRsQzs56XiD2wNo=;
        b=Zo2l+/cSWQgeXR81/e6EvXYzzd7R2duw+zutGAst9c3d7danfN45UCdh448rYwOp9y
         aGT86ZZce7i7r3m7JTNkdlQ1S7mFfdGDFBvqOKUbePX5UV0MWFHpGHFJ1b/n9X3KtOq2
         0lnQjbKrpU3roxf/FykgYWmwBSHfniF+No2d44XcWPyPseSuusVkwoiUuqAdKzVcpVf/
         pUAMh/EnUOEHpRkiNAy29XFIrBJ1983McdCaZrUWZAAsvtePPC55bAZkXbdKK+3MMopE
         oKsFg5ccB4yEw5wqG2i5hjsgyLv3xsxSA/pFUaiQkeb4CyHBQGA+vz3cCAEna0T8PSM1
         qcuw==
X-Forwarded-Encrypted: i=1; AFNElJ8y8xi+7RZDMRZ8h6reCoX5nvLVe5r2nNmdjj3iw+/RxD/fv0Xarjp4sEc9sloKNd4n/jFgj+Ql4i4/1+x8@vger.kernel.org
X-Gm-Message-State: AOJu0YzoAZqMM4WITOeeHpy9lWQF9+UmpjT+vkZw1LCtQLG0JKpine6E
	z/L+QlLs+Ev8eRnruZfWipiAs56+8rbu7MXf8AkWUBDjUeXRS1yS775a8RvjRsfKclP1E0/oRGX
	wS2uQYbYvAS5hRnndnOhk7ieaw+7pSHUhlltOY+L3WCPm6nJ9dMCUaBlmtIe/JrE/seI/
X-Gm-Gg: Acq92OHuUT99mRoOUtCFEcf3s2NyDvWEC9Fwzlm4LUO1XmeL5fNgV1FJZ8pi6+eA+bf
	MhRKUkwE2dL4AbbiZSQ4grKUB6sm2YnDJ6IbvPcvwy1fokiQTRfh63U8Id27rsPb0bY5Scbv44x
	iVL0FYFFn2TStpoY0f7Jxn+5h6AtOHRcZ7GinNO0Ns7X55yelU3JR2RZO0Cr1RzjSAOBw3uoq+T
	EPhW69/gdRwTlRnaWQJPiCscu9iMjF4e9FOJgar/uQu9826wKzo4gcE1BSIAwC3UrRrOsf3vTj0
	+bbRDtFif1q6L6KHHLuZ4r2XddAeJzEIFXBUWcbT0kEdeVouFSS1A/HmbuhyfQ8GTo6wvOpwjE8
	fgYGoPGMysEB/ZGkbb+3Jp0vsZI/3L26ElQrQpkF2x77uWq+7oRrZhc2vxN8=
X-Received: by 2002:a17:903:285:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c0a858836emr75197135ad.1.1780303277503;
        Mon, 01 Jun 2026 01:41:17 -0700 (PDT)
X-Received: by 2002:a17:903:285:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c0a858836emr75196775ad.1.1780303276930;
        Mon, 01 Jun 2026 01:41:16 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd7bfsm95714035ad.19.2026.06.01.01.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:41:16 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:11:09 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/18] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <20260601084109.nedh4dcqyuwo42lz@hu-mojha-hyd.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-2-mukesh.ojha@oss.qualcomm.com>
 <20260530-lumpy-zircon-gibbon-dc83bc@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530-lumpy-zircon-gibbon-dc83bc@quoll>
X-Proofpoint-ORIG-GUID: 6RavnfpgwzilftF9JTk23z96Z0wLX4El
X-Proofpoint-GUID: 6RavnfpgwzilftF9JTk23z96Z0wLX4El
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA4NiBTYWx0ZWRfX0XLVk93IETFi
 W6gsdnJcXkC1xOyQv2NFg+hmADJ+6XbK778VQuxLtonif/urIfY+YikoNmXUIB0dF+wfxUGhiBX
 rK71GXpVeofhFC4RIZyoL0CHv9gC2XKNmnBr+FPbOazGCNfAR4YDSNQwrjo4IzlCOkIIg/15ysw
 Y4huCesJGUMuWhS3PILgXS2chlvd3YefXKJKeJW9erwhewSC4Is/1KDKqaKelD5RDmCSnLV5KDp
 Gy7uxQfPz4kKfLBlI2r17gH3lCmwCC2tZephV3oM4f8avMXHj2EdrZFgJLHdao3U7HEOB6y3J66
 t24l8lRSdvhH7KlQ6plfAs4V69NTD9rQmKHVv4MMsrUIpdfNDsPSGNaXrxcegC2nZhUFk22yHvv
 5OwxfZ/fS8y9vIgMG9p3IMaRhsedfK+Vw3UwT9xTMLfRRYjSh55CohUb6069L2xnuTVWrGpU8je
 6u3FxWHVCmUgHacyazw==
X-Authority-Analysis: v=2.4 cv=Zo7d7d7G c=1 sm=1 tr=0 ts=6a1d45ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6CMS-Vp_-x9uo6Giwa4A:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,chromium.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110529-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,hu-mojha-hyd.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1738361BACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 10:24:08AM +0200, Krzysztof Kozlowski wrote:
> On Sat, May 23, 2026 at 01:19:52AM +0530, Mukesh Ojha wrote:
> > On most Qualcomm SoCs where minidump is supported, a word in always-on
> > SRAM is shared between the kernel and boot firmware. Before DDR is
> > initialised on the warm reset following a crash, firmware reads this
> > word to decide if minidump is enabled and collect a minidump and where
> >  to deliver it (USB upload to a host, or save to local storage).
> > 
> > Add a 'sram' property to the SCM binding to describe a region in
> > always-on SRAM where the minidump download destination value could be
> > written. Boot firmware reads it before DDR is initialised on a warm
> > reset to decide where to store the minidump either to host PC or to
> > on device storage.
> 
> You described how firmware is using it, but we do not run the firmware
> here. From this entire description we don't need it in DTS, because this
> is not a DTS for firmware.

Ah ! I missed to add that this region could be changed by the OS and
firmware could take different route based on it.

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

