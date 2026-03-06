Return-Path: <linux-arm-msm+bounces-95921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLHYBL9Oq2lYcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:01:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0412282F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 23:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4510C3018295
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 22:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469742D73A0;
	Fri,  6 Mar 2026 22:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LZFxCCUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMPAX3xP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187D82BEC27
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 22:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772834463; cv=none; b=crS+sKUO8hgDy52YPBxMTQx3W38rJfXEjjTNb7leeanI0ZC32bwkvEEEZWQHRRm0RgXh/KNpgETMrfR9dlJJtKLmdlJnqKflqFYBmOqeMSiKOCRBssf15Wl8nv0z8mLoUiHiFOwKpFwL5LAJkTgyz0qOmAPljGDtTYxAQHDq+SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772834463; c=relaxed/simple;
	bh=swHjPgms4MZhnC7AecoYqmjnZlbvr8+euga4dr04mLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjDxUV2dDbV/Tp4XXNIlpjwMbQGswX8EG2GIDjrOEorjDnKMIcyPoDEDfCcUskGPKW2kAdP2RaIxpan3LvjGsBkxfhxoTQ3Yseb3sYUGjxyrkk8KWp2mELVyxhkLuS5rGhn3d5db+Xv8SUccSu40VDXhinJD1e0FoJB9hZfaqBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LZFxCCUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMPAX3xP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KWwhX1176856
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 22:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=; b=LZFxCCUn6WpNEccg
	RJnzb64jVXdN3+LfB8r8zhZFKZvCxW7dwcQdYCpWhoWQ5zLxLUR1MJomYdDYFV7g
	52tgon9P+7hTkEdj68q9W2y7TrE9cQcZblIsqWVLvUR4AykkuAbEZdh0MT9gpOUz
	yn6Ebl0mn+fs0Z6dg+vdt16RUdTBDUpiWWvlf7fRoTPE4pboJgPsI061h4SS/io3
	Tp1FjnM5LfCpfd+0/fC/vvDevcujlhfid2NYFvI4lIa8Tutb81vWpz2IIkl66HLU
	0uPflehAB6a3WuWNrav5pU+XcrN8ONqkeOcPSYbv0jhXD6lYPAb8BSyHjYt1piO9
	kJQLhg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrukb5ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 22:01:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so8701661eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772834460; x=1773439260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=;
        b=MMPAX3xPf/1BaLsx8ci+8yu+3OOfA3u1YrvNKuz/CTEIKFCHU3cfpTfMqIwLfhf070
         imD6kEF2hjdMBhIyNOuoTT+g6Lmis1ZXrejiywUrNHlcMIQat9G0A06pWv6LfURJYJMf
         k08qE+QWp3zIDxs+Od7aixVs22JejDTdjqFRMGacUjzPmiYzLQ6r6cmuTbNu0goEcETW
         yxOX4uMFDUPpIxmNvLZ5/veM167v0CopBSbxUFeSuiu1A+eUBiULPdJDocpVSVeaZMv9
         JNBPR3xvO4XtD07hZb1Jxv80zUIg2/43BTPq+tHDig/xKURqhSKVR+U0V5AoKRtZlK6x
         kXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772834460; x=1773439260;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=;
        b=vTHmWUoJM/90XVizCmKHDdl4FWDbWp1NV+W9Qn4Ifbr8j/8NgXSfw3JWp37+YYbR+s
         rLesgSE6lHnvHlzEdKkQnBWD8pR3ZC7G9lslnm+EPEzkjlBU3yI2ApBnSQ2hu0rPvXyG
         IHJt7mOURyTnggMh92yHaA84kEgpDZVMtp1/iRCyp3fwR5iuHmIfefIKHsUidjimwCc9
         8SxzJydh8BsQCcy4x0VWSdilH6ENLW4/qinZ424erOSdHxRsnQ5FRp3HEFlmzIpojIV7
         vVSqCy8W5woKDKg6pioQ48YqgGBoP7DoZMO1RfVvPrbHB3ac7oZjTMHJ20B22nNAjLIF
         9YXw==
X-Forwarded-Encrypted: i=1; AJvYcCXNlurwiLtSDa9iELxv53l4itPEtutGPyFxSlGj5vqrlry9GdsgkXwy7hiuzo3aLWLCVJwKuA/96RU6MK7g@vger.kernel.org
X-Gm-Message-State: AOJu0YyfsqgY7i6lXDlCMJdaUF2yq+f7W0OVd2b2kXlWkYXzw/UK47/y
	a7SrU7+SPxceyQuIV1lWkHf+v7Vh4/tlMcET2lYHjy4Za445jujTcPS3UhiD3qtAt3Qij/67izF
	2tLG7XpYomLyfKd67KB6nIjfJiwxltWg6V6sjKEE83vjttqAtgb+4DkAxOU8cvo9Ow4db
X-Gm-Gg: ATEYQzz6WdhRIVZCyyRWtCjkqDLPIZz5y+9gOy9KyEbWCGBRzqYPpu/ZdfcIxinnR8k
	+iTUFFSXOupz2iiHPsg3CL+Q6WSizuj1KkRby0n7aQBZGXVUoapDgywOrCbX3kkKUWJtUmQWNV3
	KOsX9ZkMtoRIG+kMMuVFS4MeZ2SKajKgUax2hlZfDc04L0dmPIa5ju0WvEAplplTduQPRZSC7vq
	pfM7hZlyUEbGM4aMGGLy2yzBiiFdPwqWLudZfUlcPaxGEfz8gtLyTTAP/nzmRTbxPsKcyVdFzFJ
	U9LrwHXfrf+9zrsnGexLgUfYHTTuWVDGuEwm9uXnsv9XG8tl0WHXiQUSk2g9iOrBpMycSIMa4dz
	XqymDgEEvPuadOXsV5hXOgo901KSt+2nny3j9hB04E+XZv3Sbx3IQDiGdT1cR3q0IPqxObyTIag
	G4FPYk7Lw0RLiWNQ==
X-Received: by 2002:a05:7301:608a:b0:2be:1946:8587 with SMTP id 5a478bee46e88-2be4de8f969mr1272719eec.9.1772834454911;
        Fri, 06 Mar 2026 14:00:54 -0800 (PST)
X-Received: by 2002:a05:7301:608a:b0:2be:1946:8587 with SMTP id 5a478bee46e88-2be4de8f969mr1272665eec.9.1772834452873;
        Fri, 06 Mar 2026 14:00:52 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80cc1dsm1962924eec.3.2026.03.06.14.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 14:00:52 -0800 (PST)
Message-ID: <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:00:48 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIwOCBTYWx0ZWRfX+7VDrYMV5jVh
 ESrBuvtmflc1Bt7wHWFTJwIo10r6Uq/atmT/MvnBlvZ+UDDsnjA5WdN+3mbTFZLOReGmTOeJLYP
 Xfq9lzGkso7e4AsQozPvHvsTFfu4w/TRuBxE5QKVK0rM7uRWBtVS8Eng6YZZ1uH1T8NUTQo62g7
 hmJBPJq7Fst7UN8OPjUql3Ihb8nCj97+zilYY5MGrGY9RFBDk90wY7A68pBp7KZMfbmYrvtd6ET
 kH98blKrj/S9hDvr4nh7aF/hLI3OwgqPvx8nzOzJui7hAFl7AMlXrs0LKWE8A4emO0tndpvE3jD
 vZ6I5wDbRr3Ocx9rQlp4bNKBJ/3rF0THj6JOgGhg4DFFraM9o4jttfin8m3H/Ln4jm/d05shSdh
 Fn/MfYu9694/ExATtE9niZ/qi1bBiixeIipYnrr7b9VxEJ/hidAE81mDor74QrYXkRDl847TcpP
 lGeS7mcp+wyXzlpNj7w==
X-Proofpoint-ORIG-GUID: 1gZEahvtRcbG3GaEheaQs_StrVm-vX4u
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab4e9c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JJlnT80H4U8AMWgPcGUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 1gZEahvtRcbG3GaEheaQs_StrVm-vX4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060208
X-Rspamd-Queue-Id: AE0412282F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-95921-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/2026 11:47 AM, Trilok Soni wrote:
> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
> 
> What is the convention for Qualcomm authored drivers? In some drivers
> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
> clarify it here. I prefer consistency here for the Qualcomm submissions. 

WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.

And in reality it is very rare for a given module, over time, to only have a
single author. The git history contains the real authorship. So just for that
reason I'd drop it.

/jeff

