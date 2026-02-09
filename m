Return-Path: <linux-arm-msm+bounces-92205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJb5BSZ9iWnk9wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 07:22:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F39C10C026
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 07:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 154703001445
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 06:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE362D8364;
	Mon,  9 Feb 2026 06:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dmfmx/45";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwsgUmg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F073238C23
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 06:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770618147; cv=none; b=h3u5z8Rxer+IZo0m9OoDMjoBuqj5v0oZDKd26BD3UC47A5AVSysEpVPeNJr3cE0lhOcehb2bI1/snGATO4JOP7uISmNqi40jATiRtSzgvXUooBNBvNu1jkYn48ka6GLs+NhsBmKh48pw8d/DGCagt6tBicwt/6anLubxKi9om0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770618147; c=relaxed/simple;
	bh=K5/ltYlr6GRPfdVVThJFzkYqQ56GhMhiBNiVsW29wbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HonIm0N5hqEmD0dMtU0tgUX8A+qevG/WvXvabbWSX8eXc40RKgOBaQVwQxFJhCpbblV9nX18S834WpfMea3j8rSqMOqGSqf+obfQDoEKoMvWNiFvuwL2wD/aZewnzWJpaMy+bZi4pHOXmS9A4k++2hI9OBnUFbNTxun9+r+mHGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dmfmx/45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwsgUmg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194MbPp2381306
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 06:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xnO705Wu8j45ylzqS1EY9s49
	Jf6hdXoBS+EZWH+y0d0=; b=Dmfmx/450ECWWlb3wwcA5QpxYt+Qi3lWkqdEMsCU
	CnUfzkEGZckyztIJXIhQmDMDyvX8ncJGwKnUfEmJqGVeauHP6Fp8e2hTghAq0Elt
	dqwCAAS/tuft/0xNznX+uCPCCBwmMZMcHlg6NRz5lkrE08i75qOa50lCAW6g6Fmp
	cRgMnBKawvWVegeERWW/6xE0+5RJFk/kEvRARvrTpXhlI6YTO++jqd2OojGxQM5o
	Qk5v2rpsla6mCMWtvBVwkI6JVLQvZ4zargb2qwrDo0uB3/7CLhmnLHRa+bzqLdq7
	P3EJBQbkdkttUOjs7SPEJHA9m0UiJ2x4zPIabL0mjQYbCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78gdrb5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:22:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec175so27534905ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 22:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770618145; x=1771222945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xnO705Wu8j45ylzqS1EY9s49Jf6hdXoBS+EZWH+y0d0=;
        b=WwsgUmg7HTmZolcQS+0pw/0EAMHIwd0nFVn5whI3TVO3dKPAMvJV6OoyndHB4GTauH
         dyBl+AHlq6VZ73vi/rI3TXZ35PjEGW47HE1HsLQy70JmNiWlTfjoTBOCDsv6SDpjVNTZ
         awpMcx6zohhU+CWhVzrTNNcBuJzEuazsDNG9he9n6OQ62dv2awZq5r6uuCMofZ9T+ZVq
         xvI4sDM86zRdwWY34DdLy+MrsA7IiDwJ2XY7LxAPyq5xs2DCQ8dihL8AiYyfUAQ8RvWm
         MaEeeNd8YRsLUwG72UBAxpFzxZH20zOTGatiRj5Lls0aaoIzc+/eWjUCw5GQ6hIxjsYW
         Bfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770618145; x=1771222945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnO705Wu8j45ylzqS1EY9s49Jf6hdXoBS+EZWH+y0d0=;
        b=kdXfbPCqvCviGAyFcJePfIT9ebxsUZEqzHz3b+UDEBp7wwb1wjceZh9O/7gRJgzOm3
         yBGpJnj7CZmy5HLwPvF2CasYrARBFkkSmVTY7+jz8Lgw02CdydmzGrULiMYMMw4WendG
         MinZB/7QIxJQyDT09yABBCJ+/VLgUa3IIvRTIukXl4XWvJGQ19vmc2QPYCLDU0IXEosD
         rdYzbECaZy5Owgc/p6VA44T0NOSTwuuC+Ys3ogQ7PhJ8AM4A4ggEDqGybm2pouV0rl2H
         KbiyNdOc1RiJEP1nUdSNYKZCcI3VhzAo+HOIavOcmXgAhrQB20wGmobL0vZewGut5KkW
         zZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMeuc70Pj+DLKaVu7ate38ahCFd+Q1plVvozif73gtEORHjoN+8sAa+awF45n8XfXul19CwdEbaYInpX/x@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt1yTjSiHB8a0MoNfh1quDGjHynIUlSnuYP/F2FgkCuSj3S5wd
	IyXSIEyFp664f9FLZLkcTWqFZLu0pr+9le3kr/R4qthWHjubHqZEt8/M7PTaWZsmULEAaAjRSbh
	BJM/SzRlAlQPfmpCFMwCLUyhu5r8kXCBstwNZmTjhbcVMjOOAtFDBvcK5DSP+DmF2QIfR
X-Gm-Gg: AZuq6aKfu9dfvHWwo9EswTESksTjtCjXA+B48tgd6CNTEzZyckE+D9EAnw3r/oeCulz
	YcmsbcXPBFXI3/f4twWYR63Z2ujXqAZuzi333Y2ZCRIs0iLtCBpTmZZRoqcDXPydo3EQ+6uQgCg
	40M2IaipI3Fy1WFd4d69gfrWydxTOCnRZcScG9o3wPB0kQUTMRX1lh1CQD4nejFJWxDr4f/p+EI
	Vt9mtmieu+R9tLjQyqZgFZegmxghiwed8xCNaMFiYUu/xj72P56eHDIb0M8XUioua08unP1cHZE
	e2q6PZK/aA3sQ4OcavfnowwbOnqNls4EUkjS9zM3QjUOgrzUY5uApUf7IsgGxcFbGTOxbbvvvZV
	boa3Z5s0epkNQoFSTdYCu/lV7lpXxS/Uhsh5F
X-Received: by 2002:a17:902:ecca:b0:2aa:e7f3:faf3 with SMTP id d9443c01a7336-2aae7f406a2mr26279775ad.23.1770618145332;
        Sun, 08 Feb 2026 22:22:25 -0800 (PST)
X-Received: by 2002:a17:902:ecca:b0:2aa:e7f3:faf3 with SMTP id d9443c01a7336-2aae7f406a2mr26279475ad.23.1770618144782;
        Sun, 08 Feb 2026 22:22:24 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5e5dbfsm11016414a12.18.2026.02.08.22.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:22:24 -0800 (PST)
Date: Mon, 9 Feb 2026 11:52:17 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
Message-ID: <20260209062217.tx42yl3dlgx4nqwz@hu-mojha-hyd.qualcomm.com>
References: <20260209042700.1186392-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209042700.1186392-1-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA1MSBTYWx0ZWRfX3EPhNVAUdpPA
 3cdz9X06phQdfzS3SWQ/RjEs5ZomUG2J6HPnNTHtmEEhO6uHr8mhb3GKdVNBOvAcVV56wui4bQF
 bi+yU+HOvjlLOZf8vTia1N7i5yoz4PBgFsV9xa+sB92tXX4m6wXDmRbKGxW9pxC/EfX6U8i2JnC
 h88nLBiaPC/cqCszJuhPE8QULK7qBw4BnsbHC2m9mByAjN29Zr32BRbt+aCFZ8F08DJu8iq3Bvw
 DDhK9XcQyp4DRbGcYbiXdhPfUe4qZ2BtK0cwfzRu1eRJ6Lqd3Jk4tee2UyWBnfV3GxMFG83kk7u
 4G/hVil6iE6VxPCCUT7WHn3yGQ28FRygwCYk8rWxng8fP7vlj1x8y+ZSLZRaoDImfBpkYFKSKA7
 jwUAY5/DDqo9bo2yO7hqjCuC84VNIbXQU3n7kKkcO6iMpCJXfFhFbBYE15K8hkmuRRSPf1SEGqg
 HKVSXEvGGHIldWD672Q==
X-Authority-Analysis: v=2.4 cv=Fv0IPmrq c=1 sm=1 tr=0 ts=69897d22 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=2u4XCvSW4dGg4L_TM7YA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: DN8fXK3LLMeTUefKcfo-SeGZnwL9jYbi
X-Proofpoint-GUID: DN8fXK3LLMeTUefKcfo-SeGZnwL9jYbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92205-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F39C10C026
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 08:27:00PM -0800, Xin Liu wrote:
> Add support for SYSTEM_RESET2 vendor-specific resets as
> reboot-modes in the psci node.  Describe the resets: "bootloader"
> will cause device to reboot and stop in the bootloader's fastboot
> mode.  "edl" will cause device to reboot into "emergency download
> mode", which permits loading images via the Firehose protocol.

I do not see you mentioning any dependency here, although it has one.
Please wait for the dependency patches to be accepted first before
sending.

-- 
-Mukesh Ojha

