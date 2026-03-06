Return-Path: <linux-arm-msm+bounces-95714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHFcI3puqmkPRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:04:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4B21BF08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9753930305D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 06:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613CF2D7DDB;
	Fri,  6 Mar 2026 06:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KK2aGLZq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNsnLIeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5029536AB51
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 06:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772777075; cv=none; b=p6jjE4n88Ps02CoTAhLlIGh2Ozg/XjlLYOmS4XXoOdr+FzrCHeW+pzdWfUyi5NrC3ENP4Lgd3dlrWahtwM02zDzPLYd25ioMYZAtjjyVkodC8FifgkhJq9QNVazYkBLGTyoRsEl8V343xDByssdJytknoER8dg6r0H6kemW6wwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772777075; c=relaxed/simple;
	bh=qjb7kK6wFhW2UgOHfFAKXh0I9MPKRRlXQUKhED4DOJA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ycoi5oMbBA8hgBK+TJ9r5NzoXwpT73aH78+/CDRzmgYOGiEmvj7uVRA8m2OCb7jEmKrNKSYWRZ8DWKUKqmZkx0HngRHRiBg3PGvsrp2GJWBHJY7u97OpP9QfXVnmclMFZatXK2ZlTz3ZxCZHHY8WKwBSv28gfLbFrjBWgPGZd/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK2aGLZq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNsnLIeA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264aVWS1087368
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 06:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdoVzbASvwRMf0eJZjPPRXe0BdQIUXnSotU37LZVeH8=; b=KK2aGLZqufhjK8ws
	JN5Zznu1BNZK+s7GDT4y6hNyuDHhyB4pfUSefbRTtr6O461zyYlFTd1wpGtQegGa
	6jJWeN0oyfkGvlY9T/a/JRI4tLqjwtP/yM0lvF+Ed4FW1c0cP0KXCJLkKK8yRVeE
	CQOrGtf9AGyNxXAKNz0WomQ0PNmrXnvMQvFSh9/aDGyI/xwJmgYdbZoaJoDoEyXd
	zAXIivcFaNjPqywKNbXjNr9TeQZMAo2yQfSfmddQgsLL14P5vx6U7ROZAd8HiIRJ
	GxRPg9iPTM0Ls8KXbF7mjk8SSdA3kuqAVgQerMLrnR79WoVC8dLu/x3iauj3ReSk
	tic5jA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg69t8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:04:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829a535ad50so83978b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772777071; x=1773381871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdoVzbASvwRMf0eJZjPPRXe0BdQIUXnSotU37LZVeH8=;
        b=fNsnLIeAP8WbTvFqzD0TpBPNWBo8ZGHwd6GOTtpO6970bIFbfYBH8mp6q/MAJVgbhL
         WJy44g441DKFaVfYwiZsdo7BMzlbY+fppvi90T4CPdx15kdHwZFLohqCb9Ew4zWWA+2a
         pkt9Z36acBSS52SiyV3RKMg0VxLY87nlByvPOkfQgnHxcaVaf6OlDnTalxqGUweqt13r
         wxqnAKg28ygasE4BAIPCNIEHdbgGBojE/L59cV3BjnvWFpNDmazEUi4RpfUA1Gnsgi0K
         U72O3B7o3IpMp9nVyl+e0pCRTN5a9FBMUEd3p1siPbFv7MBiPO5oLxJMAEKGFAX/HADw
         ifLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772777071; x=1773381871;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vdoVzbASvwRMf0eJZjPPRXe0BdQIUXnSotU37LZVeH8=;
        b=qUYBN+uL/+4i+m5yXgitl1Xjd+Anh1NxbG4J5bd/ANtt1VxBYX9ZAlsGQ/n2DUISZm
         QyGaCCyC+cnGh7q4zd00rI+XsxhdZbOjgetERPHqbIjcgQLn8iR1mCKnVz324u3DWCFv
         cxokp+coxIAk5WwNOim6h+Ni0AlVxQ8PlE3Xt07XSR4E8S7OXAGsb2ntdFKtscRRorv1
         JvUEtU02+We3tFdi7DO4J6556AOXPQDnIk2cbxbAFJOqeErAqxSEqSW9+3NJhRTLRT/n
         ORGwy/mHZ7s227yiko/pg+pJ1BgbiaBB35Txd5TbOdFlgkkjkjm/+h+Itkxg0kLm6pJL
         DuGw==
X-Forwarded-Encrypted: i=1; AJvYcCX6gIsH7WvBX/nBHwHjcGxbju51vgaBfpebDd6L8Knkmg/B9d4v6i/Qnym3F297AhuXKgT5W2OrrVlGEkPR@vger.kernel.org
X-Gm-Message-State: AOJu0YwtL6f6dHNJB1Y8H5/tZRx4+4Jq7GyDhLpxE43UUHXnWgkSodMo
	gSoy0z6hNaeGibglhhQviZTlBNu1EwP/OxpVZWbb6bhwdeXVW1L1k3CzKw5fH5CWVyB2OF7Pq4C
	sV2L7pTBD3vWTVX9C0Ym3kQ5eWdELNQOp7ww0/R7mATbpfgrKyvMWF7A5QImo926DSnQO
X-Gm-Gg: ATEYQzy0blbcTXww/wQdsc3rKA1SCmicoQDPRgjTW/Dt1GjcogBPtnb86yZ54uKCGWR
	btefk3Fve4nVkJ6TF2G2bLkVeUObAL2ZTWdJ0XjduQLX0yZukvlrcG0MoY8BYv1IrybpoWr0Zsb
	fGkkQpTnpL/C4Ct1dMQ0ygJ2RBy4L222pfexQGJ21MCL2kZX1O3u/kwTdby7fMBhB59vLa/2yIe
	kJaFtDbDr28NTz6dJ6BNTl48bJlkud+rBR8Q/J3Uq/ddlUU8P3Ev9J21InT3r3F31FISMwufAEZ
	wJEj0CyJbBmOInvs8MgkL30kLy8Uqrn/pfUzdIiTctC/rtdQ7ozzeQyfKHY0AWnfOrq/ogyyWGF
	7+naGRdZNPq918fvXp347kcdMYFb7o8DEdK1NnvFKH6bxhAs=
X-Received: by 2002:a05:6a00:8d96:b0:81b:d5d9:a83a with SMTP id d2e1a72fcca58-829a30cd002mr960138b3a.61.1772777071408;
        Thu, 05 Mar 2026 22:04:31 -0800 (PST)
X-Received: by 2002:a05:6a00:8d96:b0:81b:d5d9:a83a with SMTP id d2e1a72fcca58-829a30cd002mr960098b3a.61.1772777070715;
        Thu, 05 Mar 2026 22:04:30 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:a6f5:7b5a:25de:64e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a44e36fesm726069b3a.0.2026.03.05.22.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 22:04:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
In-Reply-To: <20260305094404.1956028-1-dnlplm@gmail.com>
References: <20260305094404.1956028-1-dnlplm@gmail.com>
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add NMEA channels to
 FN920C04 and FN990A
Message-Id: <177277706860.7582.11134894627963020199.b4-ty@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 11:34:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: dclJWHTTZWZBs0Wr-2eJo9if7fbcgpPo
X-Proofpoint-ORIG-GUID: dclJWHTTZWZBs0Wr-2eJo9if7fbcgpPo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA1NSBTYWx0ZWRfX7oeVTbcJzRU6
 +LjuGABuBw5EiKG2d4QYVSWrGXViQPyxS13xxTKFEN7i6yUFXEFBbjLZOO0Ps1RK1YTpNY5n6uE
 1ruPcC11cIV87pMQe/VIjT3QLRpMuie5QO2oxWi8n1peIojLfEWkoeoxHlZKA1FBY5HUqrYKmKH
 BSWLOToMOBLiQOBeohXIKoSWwwlf88hUKBPgxu+fJdc4TzSaD3+/mQB1vj/rBVgeocCqzjmhGrw
 Dpfni+RYWqKBGKAKGHLMq+zr3nyMlJyMoEOREt4eyfbGC+VyFbh4dLU5U+s9qC+v5ktA8vZxYvE
 L1CsMfISgI2xeEtaaWXNYtqFoN33gsPw7ZYAcb85fyTBUxoCM0YgagwPFxNz+cHcyQmXWnLgAkt
 HrygPpJ2EdfeJpq1K5G996syjgD09uG7XpyKNIjCGA3pZYsAOy2ndM03YhNDo/fInTBmy1+1N/1
 VBiBGrteJkrMwXjY27w==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aa6e70 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EjD74-KgWZs1_kCVw6cA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060055
X-Rspamd-Queue-Id: E6B4B21BF08
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95714-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Thu, 05 Mar 2026 10:44:04 +0100, Daniele Palmas wrote:
> Add NMEA channels to Telit FN920C04 and FN990A configuration.
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add NMEA channels to FN920C04 and FN990A
      commit: 3763571de400595917b81a31a036ee289cb4b4f6

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


