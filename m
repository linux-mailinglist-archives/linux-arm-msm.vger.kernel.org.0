Return-Path: <linux-arm-msm+bounces-113929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VTx5CTnQOGrziQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3376ACDE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:03:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I2zZHh19;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ktIt14/h";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113929-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113929-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EACA63026F38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615EB35CB9C;
	Mon, 22 Jun 2026 06:02:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8635B125
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:02:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108165; cv=none; b=DuzQRmPpfDiGDavNN2acsS7O2GhD4uVTklkgAFYFhZOzXhuV0fMKPgVE4R0AaA0epEGbqsx71soPmFZ7/Whj7nvydrGJ7a4K5OblK/E8EH3Y5TN2KDY9kGevvw701/aJpetVYu8DRo+WRBH6hpEAzFLGgqaeaIFHBNMlShDFzaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108165; c=relaxed/simple;
	bh=fhF1jkIK148QJRPMwgMFNLtsyUT0Tq6j6rDts/hWXk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p2QXm2wgjVhfqD4uoItzN+pJ2EboJne1wmoCqFepMRxjqIDefj00484kK7vUu33RKyIV+xSiUoLEyCJ1bYU+oNCs+e4kRe+skpZ4mG8XZgIpQjZ0LdX6oMhrwv+4UYBSKWjmxofgcMpYQBoktRnAeMe6Gw3pEfqEhZmrSDee6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2zZHh19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktIt14/h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5Al684146504
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fhF1jkIK148
	QJRPMwgMFNLtsyUT0Tq6j6rDts/hWXk8=; b=I2zZHh19VpeyrTBrzHyPcXUJCoJ
	OxAwhLJSCD48w/Uiz+2nYqkMuDLIy8928uFQawDl/7ZIfOQSQXoPNzhp2GXCHmPY
	szMyEtOPdUJ8VFGIq9L1oMlwe+aCkuWS/CE4FosGmI+jiZfL+Mzyoy2z7hFWumfo
	1chvL9sOx0f/hBj2rTiS7WpVsU67Qk0bHdxFwaRpRKwO6xaPRbY3/DABOCFtMzng
	TCNqfJlWmIbkAl1KZnmYvpn8ooaw0tee9+pkQWuKTUB1iNi9QRDKGbB2yAtH3n4C
	uWWRSyrWboTz5yzPO6umYoPeckI7JWbuZxh5FK8TvTqm0mQfo/QOkKz7cRA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk884vvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:02:43 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f3c83df1so189425c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 23:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782108162; x=1782712962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhF1jkIK148QJRPMwgMFNLtsyUT0Tq6j6rDts/hWXk8=;
        b=ktIt14/hhlZNmWYZ2mAw7hzbmRJPV4eYb2/ObDPHJwZKxJ/gE+HhQ7EtyKELhN9mu5
         0/qSibrAfcy0HtJTSmDwCkaQG5dd3mdqb6SegcF12hrrzPAto7q69ORWV+byIUQyNozj
         UT/qSEp226D5AAKHk9i6gQEYjHOcBUtCrPd1RpXt4MTL65cOBPCEMyZadGbgxUEQ3xk0
         EfVeXJ7krlNE5NUOH2lWwJZJru4tpqUyeyflrnFMhYb/J3CoDSwe+DkdihEttBYp+h04
         3Ln1PmIapeZBoWic0mAfrMbyjjwsr1DrWFrRxgV4dzzr9pmkMC4shhFWFXFI2c0OeZqU
         figA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782108162; x=1782712962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fhF1jkIK148QJRPMwgMFNLtsyUT0Tq6j6rDts/hWXk8=;
        b=CrFs7QWFQQjx3H5WQ2esx30BioxD5d4fnSGw3/g2qF4Rn4rq+4U+EDFiahEQ4exWuA
         wexxunxEEEHEDyhTv2Q3klHOyzXuxF6oxNGMJXQzT8skOHeCe5nKOcwbw7Y1x232hc/P
         lYtCOxyGXfTR8LizCw6zM/t/zyGmz9jAzyKEeuUfn3q/hVBqXwYZscrS2yBIvjCWho1I
         /geT+IaZuEUK3BmlRtCXQU5aSLB0Pi6vbPLEYw6Ndm61YmxnXTkvPf+c/GbIANY9Py1N
         HYwhd3GUYBep7TqaUa61sTlTcc1pmiKWwwOE+/dnwxaj/gjwCr0NLLXmi4vdAMqDpMvS
         XElQ==
X-Forwarded-Encrypted: i=1; AFNElJ8T2+Mn9u85bi/aaWC/YnPA/DTqr0j0Ou8ZQi0pOq63eSSFRmsIjh5xePFvoJj0kK9FwxxE6Y9QC9VOWEUn@vger.kernel.org
X-Gm-Message-State: AOJu0YwzqSyDOEb1zy7M1O+8lrn+WI6b+8sSHaOlU7UeGP6d19guekEP
	6r606xuc2gblLKQ2QXEEtkrQly5t8SFbDPHZ46dv++gPxFsT11aLlo7o4P8FvtsNnnnlJlaQkmX
	9ZeNLChCxPftJwVAkE74Vp8f0HXBkEYPnynzjNY5cYujQDhZpT7t2EyZm4WdPNnpvrC6N
X-Gm-Gg: AfdE7cli0YnO6qlrI0FLK6PIpgKhAIfqYXG9uTWOaMlp9czQzA4suf77CXWclHLx4mM
	e4M6I9/26ymyKzTHYaD9dW+/PRYzKdwwP349lWd6xpoPCRMHali+iS84R/mgBtx/mKKaqBazmyX
	Nw+bdLWsWE8aXoXaSQQOiRjDutpvBbSqfM0bc2WRv30QahXYd+7I0xj4ozEI2eYYHGo/aNKpe8n
	XFZ3hHDvHzY3Fmasld8Rt/1Z1iC9lOfdTA0qvUxgnIV2j0A2+VxrKCXLTmfDUq9s+bPQcrfdjsh
	dz0psp8IhwGDzPWfJH09nkCYQQYLSshzHjmbCOwheyi2aryjC+xRGkXOCNYfTxFfv3dDTqb+no+
	pkvZ9aSKXQra1u1uv6hW96zRhATI5ppnjQnCsDEb4t0fSOjrbUDnylCpC8toD8g==
X-Received: by 2002:a05:7022:6981:b0:137:fea7:9297 with SMTP id a92af1059eb24-139a2035a3cmr3794601c88.1.1782108162008;
        Sun, 21 Jun 2026 23:02:42 -0700 (PDT)
X-Received: by 2002:a05:7022:6981:b0:137:fea7:9297 with SMTP id a92af1059eb24-139a2035a3cmr3794589c88.1.1782108161301;
        Sun, 21 Jun 2026 23:02:41 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5bd68sm7558262c88.11.2026.06.21.23.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:02:40 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
Date: Mon, 22 Jun 2026 11:32:35 +0530
Message-Id: <20260622060235.746205-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <580db7de-321d-4f4e-99f9-3c9a1cc5a3f9@oss.qualcomm.com>
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com> <20260608091702.3797437-3-wei.deng@oss.qualcomm.com> <580db7de-321d-4f4e-99f9-3c9a1cc5a3f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA1NiBTYWx0ZWRfX0fDHvBNXUGBo
 J0kFoz02cYXyb6QTMVLdReLCBKsMvtMbtxyw2d2eEV7f39D6B3/XjbzIEu5/nefjojLMRxHjPRk
 oVvcrh/tc2bXzKiGTzYmpTe/KdOQBS+aHZ1LbKnBahHf65FhtR4iy8GzvSGC9pZ82MhNvkuncLn
 x72xZRDWI/niykXywROVPxALy82BjrynbTMgUau7YKNZ+hzW+7ZVX8tgtXYaXxguk3+uJhW77Km
 GV6isWhIH/oNCUmJNYVv/IY+ubMZLyelRz0kUAHC4sNn/2nCi79H1Ucyj4Eom0nt1JDqEF7EjVE
 NeIBnMQiJL40M7/4AwHQGbFvV2d5q1zZ2NzBnyBGrZvlwnaODxNtgqVEIhaQMH16betYY/RLVwx
 XO5QMD/dU+pg6FXldlK5BUHGEw1H7aZ5sclfYTutBKFMy68Pa198mGQ09N4QAckgVQpJM0lEIFj
 QtNF0kLyDVSrQa18k6g==
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a38d003 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=wHO1jfwDuY-934FNkv4A:9 a=zZCYzV9kfG8A:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 5dKT8Jv4aDHe5xp8AIdJ6ET6f9Wbsnq4
X-Proofpoint-ORIG-GUID: 5dKT8Jv4aDHe5xp8AIdJ6ET6f9Wbsnq4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA1NiBTYWx0ZWRfXxGsa8U2F8wRJ
 ds3nTwK9l6y5LEUEeLUJnMa6C6jx3mFRO3pVwr6awXCuVzRCtnOtn9XfrPT/fRrxcqKMeVshn35
 /LZdUsNEvME8n1gQGhFhGs4JYwQlTew=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-113929-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[wei.deng@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C3376ACDE2

Hi Konrad,

On Thu, Jun 18, 2026 at 11:49:05AM +0200, Konrad Dybcio wrote:
> On 6/8/26 11:17 AM, Wei Deng wrote:
> > The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
> > wireless connectivity cards over PCIe and UART interfaces. Hence,
> > describe the connector node and link it with the PCIe 0 Root Port and
> > UART17 nodes through graph port/endpoint.
> >
> > Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
> > lemans.dtsi to allow the PCI subsystem to associate the DT node with
> > the PCI-to-PCI bridge device.
>
> Ideally this would be a separate change
>
> Also, b4 can't grab this patch since there's something wrong with the
> threading (multiple series in a single thread) - please switch to using
> b4 for submissions yourself to avoid such mistakes.
>
> https://b4.docs.kernel.org/en/latest/
>
> Konrad

Thanks for the review. Agreed. Posting shortly.

--
Best Regards,
Wei Deng

