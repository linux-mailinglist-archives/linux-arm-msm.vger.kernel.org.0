Return-Path: <linux-arm-msm+bounces-119197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yTDsCiRXV2prKAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:47:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A8C75CAC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:47:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Dmddtxtj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hndOCeRK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119197-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119197-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2BDBC3006B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5780843B4BA;
	Wed, 15 Jul 2026 09:47:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782EF436BE2
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:47:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108831; cv=none; b=aFGgKrdMokuGDoMc6IlDyRh8Ca+Gbe011vuEePqMzjl/ZZX431fFpY4kRjt6d/h1Y+uV5989gmk1g3ovLP9J7vjANaFL0hoNE4hxiZAKb5VNbxFtWH/v1+Rc7Z8CYmq8bDQWUNBjIQcOy0d+gd9TlpIYwipu9Et9qn0KUTIadqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108831; c=relaxed/simple;
	bh=NcNYnaC731ZHLrthye7V1QxnuTTVy5Z8iAeghnT9hJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oq+MVuB99rB3pIQPZ458008XFm/9PR6i/z4R5mqzM2pmQk2Bbx+1YbiYu/HUKY3PvY69lAh7vU34FViof6ZIauBsgh8ZJoM9twXw9ldxQoZDTamMHnqoVIIM9CejADo4wxSyeg/bxMRlQcQXpTxZcfdc70JDoxb2DKetLgoRWjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dmddtxtj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hndOCeRK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9R9Uw3143676
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcNYnaC731ZHLrthye7V1QxnuTTVy5Z8iAeghnT9hJ0=; b=DmddtxtjAoRWSWZg
	8dHlSqWjmP2oZJtVDmgsOGq2XduC13N4YcSEPM9qQzhbiaeT5iEKUYy0KLt5ywcD
	khzzmn0cTzzieiyjM1UGFUCz2JvnGwL6SRdT9lzDNks+9+kxdNx0nrcZ9hjIMqo7
	R6VMzz9yGCLSFfc9zGB2I2ChB/Q5HXUbtd6uN9NEcvUF1fvyeRqAKFsP3qKPkZfo
	xzM1LrIVaDX27gM6Kt465cmXC2NVqmcOQBTCeankE0zVeQj/Fq2a4+9GxiW+5WcV
	kStM1YsF9Jo41FM0qF+exD4uQEQLTY0cZ8kBToqCFqlPsniTUfQTNgk+mdAxD64U
	ryY+lA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka82mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:47:04 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so25427686d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784108824; x=1784713624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcNYnaC731ZHLrthye7V1QxnuTTVy5Z8iAeghnT9hJ0=;
        b=hndOCeRKB4S2Fo3KI0KPiIcujTuw/s+KwxdII2bh0MDhO2EieHXSDU/oxmfiTwZ/jn
         D3EUCWCPOj1hD6I2kxTxloakBnq4cYI0HYh8LSZqaCLNosjhoiX0Hp+DxnegjTCLRSPI
         RvHcIew47S+OTFefAT5wC5khW3tzBANB0mZTCXZyxbhVhsJT1CNNFsTlbA/bsNm3s3DL
         JzFwCpQqwWWU+K6njmqHmEE/7Sv050iAfHCBellFXj5GVXbQ8gSjjttXU2beKcCEaB/i
         NHlLP2pKGGZcE+kFRbAyN3kP6RyJsUblzuPM+pfO1JKAwuuFYQQnPj9IGpmNFwAPiuUJ
         htKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108824; x=1784713624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcNYnaC731ZHLrthye7V1QxnuTTVy5Z8iAeghnT9hJ0=;
        b=cJETL13kMKomEGLa4S9WevTDynHBYe+FaWRG6JyC0QT788QMNVFcCeMLemxuJzmhXE
         OCtxt19IB9iCZX9BZIouri+Q6OQO68NS6Q60f+FH8EwCODtkMfodFxHVRlzSh9K/0OuB
         ktnRVcitYsEHELxKsRZyGKnHgArwPB3i/dx/zM0x7/s9wQQwxuFs+vHg35+JMv7cTMOn
         oXqWLVdTDHz8FfYmfOMtWCFYCW+v2xziQXVwBlIPu66bfPGt6xD8kaurqE/MoQfA8X+V
         XqJ1VYRG3AyuQ5qyvNj4G1GnRBfBYfUaqbF0XGGpbLJ3vPxZdrd+RZCiFn5+cFS2ZKNf
         0gfw==
X-Gm-Message-State: AOJu0Yz+v/j+lQsZb19fH80kJx7IMUJPKMs5rOi33mpoaPEx0JZPHCpW
	j2mmdjX0YBlkAqE5royG3e+WPkucOiwSfqj72E/pagHqVuIW5TYQO4cXhcfmRqOnoxd5Z3aXnWT
	cpHunsJe2e4FLZqQSUyItEtXZ6F1+oNWhdtG6WgzYH/cbE3MpxPTAJdLkUNJAFhIaVhME
X-Gm-Gg: AfdE7cneFTwjjUBXq1rLg0EsOmY0APhdweeCS7ntZlmtdJPef/mTh1jfjUL11LKQ4Q4
	h5U3o9QRz3H0sPIwYWX7iydY8+p5I1jpsTBZcBs2Z+nOBOOvK9n32r5nOlktWlqhiq/S26Azpw7
	6hxQNTU9Nz7m0VGwJr0IVu0ZwfCT9HqvfWF6GF3TVdXBPUoL0/Nwq23ZjeA2a5OD/dV+HNewpD6
	0/ROR8bu74BhFv+/Gucjg4xbjG4N9X5MaR2IPEnH104+tlefgoCtrQ+qdpA4dcRkW3dqOkG2Vb+
	GazaWrfpogB0Mja9yEqcL8UEvoUmLMLRgmEcJMhAGqkTe2YrQ3Z0it0dVWVRMnBSVeSnqm0OLMF
	LcYgMPtI2VOrt2rTOf85ZxeV82LqIbMnoLBA=
X-Received: by 2002:ac8:570f:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51cbf086adbmr143777731cf.1.1784108823590;
        Wed, 15 Jul 2026 02:47:03 -0700 (PDT)
X-Received: by 2002:ac8:570f:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51cbf086adbmr143777621cf.1.1784108823148;
        Wed, 15 Jul 2026 02:47:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2936143sm2696576a12.25.2026.07.15.02.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:47:01 -0700 (PDT)
Message-ID: <7c8178ec-8bab-4427-8faa-5b28cb76a5ad@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:46:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] irqchip/irq-qcom-mpm: Register MPM under CPU cluster
 power domain
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-2-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a575718 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=9p2gFlySMKisLTOENoAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: tQChHP1b8r2OelNrZ3wVrImt8HXyIfw-
X-Proofpoint-ORIG-GUID: tQChHP1b8r2OelNrZ3wVrImt8HXyIfw-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5NCBTYWx0ZWRfXy4KDoZw/EGjh
 xrm/StPWGlg6jP8GuGNofM2CqWyMYi+dAVU6rp7ykXYXCBeKHXY6LQda5IiE9g5bWfpVtYPEP9l
 5TZqq7Yq+dF9Gn5jt3vafV1wmfw+nvk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5NCBTYWx0ZWRfXziI1ELx0LFXG
 v8aCWOZd2dZWcjX0n94BadiMkZ2L8Feh3d8KOc/kDHKgqdFwnouBHlWi3CbzozrUZJUdr9Gb0PG
 0tAqZpGm/WeYrQzvvSesgQlAvUPbudJU7tZt8hO9Q7cZrNN1LCexnZctyeoYhEBZAlFUF0XH7n+
 F3l7r1120Mx7Wm+nSv8cCqX/KcjjZCcwHpYkr7fgZwPgibJJZF8PtLbyLfNtU/2ydN2Q1bxmkoT
 i1XyLzhS0G1SyArDg7gdEAxU9nR5VqC1OkeTCde2Xt79AeMwNKAKYoCydbytD8Ue39IfVjmrbYH
 8Mz9b5tnbBimm1gxckOgrbG/Tcnp206bXlELaPu6PIT+1+j1tqpVeYaB6Km8lcI5V6XH8CN4Zkh
 FnJipB3djV7K98OugKTV56/sRjp1hMjlxkLUcHywh+9ANUYVNZybuH1ZsxgeJQPZBOW5op3RdOw
 wHC5GuZewunBM3qz61Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119197-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6A8C75CAC4

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.

[...]


> If MPM has not registered with CPU cluster power domain, utilize the CPU PM
> notifications to manage RPM communication when the last CPU goes to power
> collapse.

I have mixed feelings about this case. The RPMH RSC driver keeps that as a
fallback for platforms which don't have PSCI OSI mode specifically.

On the other hand, there are platforms (early arm64 - pre-msm8996 and almost
all of the arm32 platforms) that don't define any CPU power domains, so
perhaps it's necessary after all..

Konrad

