Return-Path: <linux-arm-msm+bounces-100476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJETGhryxmmpQQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:09:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1B034B868
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 22:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 686FE303EFA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B4B3947AC;
	Fri, 27 Mar 2026 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKwJjL51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpmaFQXu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9F3939AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645781; cv=none; b=rbNRDC1Ht2IIJ8GWoNvApDZNtc9CwfDkb6UHdeON5ba0JcUugqPsq07bzr46H8GYOJievW3xt0Fh6DU1rXUde+Kvf9yXTQRZMnDSerkODQ8tPi0x8oc2Q72zsZkmuZcU2zoDZ4EgPs24ZjEhureyOZ3GEsV6eDBisG6tVYKx100=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645781; c=relaxed/simple;
	bh=xPmAaAmRjskAsbMZwiz5rfebC20GUQmK6lfDzqPwRHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFBsc0PrrhwtiFav4mvfK2FjXXQfq4ccoArElK/KZgP4rSVXcjUCV4h2zYd7MsRkw1xl/AM5nQM1LCR/NITm6UoNuV++xfRwsjzFMYfT/bQF4wKK72NiJw1YBuLV4m1u90WDDYrnRlyVWHnry6/dOYcgvxpxUEHbhMbwopsdp08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKwJjL51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpmaFQXu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtKgR505696
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YzZWfr/MDiiTVEfHoij/tw82
	t2ttCOqWWYKj34YtaYQ=; b=aKwJjL51sY4SYfqN/KszZgteRf0sBMB9nSs6Qy0+
	g8OBzOLEo7KR8iEFjMqbimk3xjw/R7Ftt4laiiCBwgH1CNwc4Q6sDU0OdogxMjMv
	4vl4WI+O25PerZpTgQf3xhmtHBFRAWnDAlG1Rq80whdwjLyCwVHNw9iW/CPeUUMR
	ZXaeVGKsc0iPHdHHXwiUBZvh4cLIR8sl1sJZzppdgmv9uaDNJQ8pBBrbOIpHXFaW
	DDOIIJb/QyZR6u9s9jUZ9fKzXpE4Z3/7AnQ9EoQ/YkESS33DN3+matD3TF0e7/i6
	+t/SYc1y1MG9KivqjABJGt7qo3CEWCdpVqXxz+JJHMSVmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhhp9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 21:09:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso119702301cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774645778; x=1775250578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YzZWfr/MDiiTVEfHoij/tw82t2ttCOqWWYKj34YtaYQ=;
        b=KpmaFQXuzAuTZXWYeO/26H5fnpeHafypUut4AOpmYL9iqGdafAV21SLTU4D7ndFWP6
         RRmklgOKV3vATTM/GUU/tCQxVv0LQGfp3d23LgbcSs4McU8C4DWJGUCEs5fFqMZ/tc7U
         HB1gwVxtv2A6zSTmXh87Ykq2xQT4J8Z43ffAv/r7UVIPiospsTfP2yCkYyqXt9Ux/QOH
         NHWZtQo+z5kt/fi5S1neEP8r/ocEBwtbqvTs8z0HmG6QzkVywmJUbslsUH22yr/des25
         w9U264y+xzR0rfcpC3HTUW6CrmiZV5mO/aNY7BYOwIwIjdXRNWiMPMjkxRsQThRmGDLL
         iA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774645778; x=1775250578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzZWfr/MDiiTVEfHoij/tw82t2ttCOqWWYKj34YtaYQ=;
        b=XhEaMUWfnpH0FvHrycvVcJS106xCoJdd3EPagCNDs219eEeE1XuCtuUtNanM2qy1As
         6W/eAU2SBHqSW0fkrOTt+uBSgF7QHsvkiFYVo8Oi9w8xQjrSoeJxqbZbyTIAuPC3BeDf
         XnMzBogZPSvQaey05J7QJM+1+yhTClYgcze4qXSZwpqUV5evNBKjTTX4ioh+QDZcS8JP
         sJAvzomhmLfO/MBCAE+ySA99UKEqlkFq1FLVmHZvrkTQjDGQ4I8D/FM2BwlaHFhqgZw3
         tIXYZKS6ZJysbO5ZSiAWLJIjx3Ak5ltJYTh/E/BYI5Dae+7oynt8xKSIHu+fOXJRV7tf
         RBNg==
X-Forwarded-Encrypted: i=1; AJvYcCXj2Cje54lbJAg9+zjw27Z8TN5qh4E/cSoq5Xx34sC4Ze56kajW4GLk39qNSlXtCPp7t37ok51CIteKL2FQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwK0QSCBaMYD3furfM6DKSuBcma1BAj9nNE6PmmTgGvCtt8fmG0
	xNTlSE3tteNOC5FDD4A/ExVdW/QNyS1EwUQ6L+tJFx86S16UZkz1ZCFjWFJvhJMzg5Zu1pWSaYV
	DfSSaHhy61pElfWlipJZ/B9rOSqdQKB0caCw6yF0BKj7A7tGGxwxQeLN+GZyuXWspE6H0
X-Gm-Gg: ATEYQzw+F4twuxvF0FrCV+Db4NlGZ6OYNoNNqa5kdrG1q2BqIPhFzEvFKL9xwkAytyO
	WN4FiDJlWfuORMuVMXuDkNrpmkbUcpIflGovELs1HZmCBU/gu1L7lkvmaEGMKwIpb1a4LwbMJQf
	1LCq237hMVSfomwTcmt8pAJ2dJ/wLqgiheCYFVpJ9vyuRQL1lVpipbA6M3ZjSnVzbQR1+AorKhK
	CFtQLj49myPLNUzvoLU6pSzyBaAQ938jhLEt46yRGyzeiAlZknlGfRDQyjOdqjOhDH6fn/iIBRW
	2fuzy7FEaw3vcsrtkO+LSIbIfbT2iiKsEZ0zifMYtw97DwBQHNmqgD7+vCjSZwCTkh01ebMnVIL
	2oQFkQL+bYZBwQqdns/fNrU2f+ja57lTzN9QzIlEQA5gsuEkW45QPcO7YM2PN8Y5wZN3qpmw7Mt
	qWRNCOt9hpgiPWfahZGkGCK7BR3ZP2+i8EWNM=
X-Received: by 2002:ac8:5982:0:b0:50b:346a:d253 with SMTP id d75a77b69052e-50ba38c99c6mr52460151cf.43.1774645778324;
        Fri, 27 Mar 2026 14:09:38 -0700 (PDT)
X-Received: by 2002:ac8:5982:0:b0:50b:346a:d253 with SMTP id d75a77b69052e-50ba38c99c6mr52459751cf.43.1774645777872;
        Fri, 27 Mar 2026 14:09:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b144e99bsm23482e87.56.2026.03.27.14.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:09:36 -0700 (PDT)
Date: Fri, 27 Mar 2026 23:09:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Steev Klimaszewski <threeway@gmail.com>
Cc: abhinav.kumar@linux.dev, andersson@kernel.org, bod@kernel.org,
        bryan.odonoghue@linaro.org, conor+dt@kernel.org, david@ixit.cz,
        devicetree@vger.kernel.org, dikshita.agarwal@oss.qualcomm.com,
        johan+linaro@kernel.org, konrad.dybcio@oss.qualcomm.com,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        stanimir.varbanov@linaro.org, vikash.garodia@oss.qualcomm.com
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
Message-ID: <ebzdn3aplm76xkvljwpg6v4mid7ljslhzwnf45u4obgwhcnckh@rtdv64on3y6b>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260327164651.45628-1-threeway@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327164651.45628-1-threeway@gmail.com>
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6f213 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=S4w9ywDKMMNP_Wft0cwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: YX42GhDBjIw52637YWmy_iWpvGImp7pA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0OCBTYWx0ZWRfX2M6sV5kw49o4
 eEPKU2t8lQPKtaocDqG62UrrqA7T0DQCYoLebDOGYUE1d1LnPy9RGb6mVLSjbnvwNsJMqoxi78/
 gZ+Sa0dXtnXY+GBjvQvp+S7DuKkDqnqZfD9lWz7s7Bvt7MinmQO9KYn71xhbJ5hqvGlnskFhe/+
 gE92f3mHpqoh4Y7Rr+MM/vzBwoFg/wMTy+7Mra0Ip9MeUKlp+nCI+RY0vXZ0/A1lv7yneknTg7n
 KbZlmLy/KHd0XTD+BWwqCjrSRYcMaSC5DEU+h51ekdJr+afLThw2lYIQ4PFqcWsUQWCbo8cXoAO
 0gu14SWvx8g8jT/NyBzfsnkTgclScFxOkegScSJfx4XQ2SmW+NDFISCFysu2r6t4uVYbsGaku5A
 wCImrvjqX9huCUpiglAHexLbyLnqNKEv/Wo+yPZKPQPVyXr93/EWxjMnyMm24/FKlH9BRAvcZey
 brqcZTk2Jiofye0g4bQ==
X-Proofpoint-GUID: YX42GhDBjIw52637YWmy_iWpvGImp7pA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270148
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100476-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A1B034B868
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 11:46:51AM -0500, Steev Klimaszewski wrote:
> Hi Dmitry, all,
> 
> I've tested this on my Thinkpad X13s, after disabling venus module otherwise it
> loads venus not iris.

Venus with the SM8250-related fixes should probably work too. Anyway, I
hope that the series switching SM8250 / SC7280 from Venus to Iris will
finally land...

> 
> So the compliance tests pass in both el1 and el2, however, if I attempt to play
> a video in totem, and then skip forward in it some random amount of time, totem
> freezes and I get the following splat:

Thanks for the additional testing!

This might be:
- A bug in the firmware
- A bug in the Gen1 support in the Iris driver.
- A bug in totem (heh).

Would you mind sharing details, which video were you trying to play (at
least, the codec that it used, please).

Also, does it kill the playback afterwards? Can you start another
playing stream afterwards?

> [  143.388380] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd516d400, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
> [  143.388390] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x2a00
> [  143.388392] arm-smmu 15000000.iommu: FSYNR0 = 00600002 [S1CBNDX=96 PLVL=2]
> [  143.388423] qcom-iris aa00000.video-codec: sys error (type: 1, session id:ff, data1:1, data2:deadbead)
> [  145.913827] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  146.945692] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  147.969651] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  147.969693] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  147.970493] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  148.993683] ------------[ cut here ]------------
> [  148.993695] WARNING: drivers/media/common/videobuf2/videobuf2-core.c:1827 at vb2_start_streaming+0xe0/0x17c [videobuf2_common], CPU#3: totem/7330

And this points out an error in the Iris driver. Quoting the comment:

        /*
         * If done_list is not empty, then start_streaming() didn't call
         * vb2_buffer_done(vb, VB2_BUF_STATE_QUEUED) but STATE_ERROR or
         * STATE_DONE.
         */

Dikshita, Vikash, would you mind checking it out?

> [  148.993727] Modules linked in: michael_mic uhid
> [  148.993732] qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:e39bc002
> [  148.994543] ---[ end trace 0000000000000000 ]---
> 
> 
> This is much better than the previous venus patchset where accessing the
> hardware decoding would cause the machine to hard reset at least!

:-)

-- 
With best wishes
Dmitry

