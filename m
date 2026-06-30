Return-Path: <linux-arm-msm+bounces-115456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nWcZBWfLQ2rmiAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:57:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1056F6E51FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:57:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NJFmWDeD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="X/EQEN05";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115456-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115456-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6798F300B8E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06684367B60;
	Tue, 30 Jun 2026 13:57:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A052F549F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:57:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827829; cv=none; b=qZKde7aEYNOGjG4v74sBVNNakzYPvnl3DeEPsHfic/P90SXpel5w0naMr0b0FoxzFkbmlI7u58YsNUaiv/fAUkJnzDNeqHub3yVh6MjsIJeTZtKPonZ+inUP6Y5kaPnyFdOMjceI5AxGqMN0AyXXn8GmRmGOj6B8QQk6lfFmDEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827829; c=relaxed/simple;
	bh=d1Xt+LCSeLsvO5aRhd4vU+y91sKUruPMlkg+Ebm4BfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HElIMl1wnOc0+r6leSb3le2ZP+5OEK49fCfXql4BFKixHu+R4sFuUgtYyUwWYn7FWe+ls+cgZHFL+2XlOm1nLJfF09qenTkM8j7HLPPK57vhC+cTvYAa4TQHuCYuNrVja2GjgVDCrn78MC2LDUhO2xcViJnMn/71KmI2CKpH/B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJFmWDeD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/EQEN05; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n1Uu1612259
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5xGf3q1sMxp7hVytKtAfTiomXRp8edhMsYCsyjla46c=; b=NJFmWDeDxxzpzIQr
	JZzizpdOC7LqG5EH9JFXsTxreNVt7jo3OIMI1OZHLMeg8/dCwv048IMAMygxVOyd
	nOU9sWQwFQtTHnoeTU1qgkn4y86o87eiPmSFY1h7XeSY8PCv/U5xdPi6QA7epDH3
	UBWdWJQDcraiRDd5j8h1fgTuv/1TMZ0bWPmDVojKkBoeC3c6A+xYGq0J3KYc8xsn
	pDSbpBeRiFm9v+5y6nfjgzJ9I3LAraawRoyWGaZGmpnuVvyJ46qIkwO5wmhQx/6T
	zi41Lmp+esNCxEwXhQKQA9ByEa67bCo9OonnvvXq+DpCpfsXyls6CTcnoEcAoG8N
	uCVkNg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gtxq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:57:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6b97afe7so12452885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827827; x=1783432627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xGf3q1sMxp7hVytKtAfTiomXRp8edhMsYCsyjla46c=;
        b=X/EQEN05dudiQ7gN5BPLHIUkbUKbwWE/PBmvL5xJ3OhUxKstrynRbBoXzQyRZwLHTQ
         1xQzVm9WGyu3E5e0ac9Z1yqjqnV8veTrrbaJWzKOSdPEAg3wa4AE1FHoKmz/k3bgHHpN
         qG/v0r29pKRzdl0/NIJiEbRwb/ISAAPV/iwKIRAmzx7RiKVpj76QoOCRxY4KSbIM7Nw4
         4OqNg9kYnilsES5XpVtrrYHv8U8DkZj+kaME4K8EEvDkacAsw/viRDYmzX9apWkF4gGk
         ZuySGII9gebb0GaO2EY6InOXNnSi/FWl5Ep7ewpLItgNMOQ0KkMNIXIxcBbbpP7Dv5mH
         s/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827827; x=1783432627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xGf3q1sMxp7hVytKtAfTiomXRp8edhMsYCsyjla46c=;
        b=nF1+4RPDHDoI4dpR7gCpaMXEHNOz+Z9J81oI+NvJQ4L2MZEfdreUZo4L1LZV1tyqAr
         do+15h/hPt5j0drsrqDL9DNvsnL/59Y85nSEd6lf8l5cuOEA5j85wZCBJUEieK4LRnxM
         ydtTgwvGh000RWxq9nDyQFw/L7Adtu1hnj4zuZbb18Iw+2S5GQ8ggKezjj6bGG2bPDhs
         c9CAgkUkC4Ia0hNiwX6wsF4hnvRxdLhSTjNaR4JwPR6dL/Y2QsywzaMOtuphchLavhpO
         S/ObcC85mxjukOqXKRc6ath0Tz4Zco/yuBVIoCP2+wggDtXxkA3uZ4Adi4xf123imw8L
         DdSQ==
X-Gm-Message-State: AOJu0YyhrFsDqRFFAORaJLktIKzk/yYqBcjdQOBCoCCowxoqI/OEaMWx
	h4kLe7dlynDg0ESa2LR1ObbkhjLpAt0enUTJiy48/qXS8vI+dB/z//JhffdZRxJrl4/+Zv9wJKZ
	4qvhpSW0abBTO3sfUbdMHJL064p03vLLEn7DImP5D2pjuag2n0nvkhhrTsGSzmfW5NjYH
X-Gm-Gg: AfdE7cn7W7zXpWAEZsA3iQXsLVpEeow4mOrh4/qSo6pg2v2v6PK2hrDFF/YHQ7Z0Dz2
	8n9kTvbQu5DDlELFb+y/NMEUHyiYw5RfWQH5G8nhgO1avauuy2QBJVcXGZOD9pmTrrLRwH82qCW
	q9llph0tfiI4yY0CZDz6CC7Pp5yUjJCJYxuTGKPz4D9xSV3KvhBtEBP+RsrnBAyCa870DMxqlam
	F16x2Eb2zDi+mw3sit6yT2U7zHdHb0z0+JkcPRRGKlzyb771ri/HzA6jnt/dqmFr1dMj6jAfPpy
	1QoHEkyOjXNPEfvDbXsTQMwTKXm1XAVq68BCUiXQej5h3E2TroIsYTl540QYkH9h3bnxQy2xCjT
	Ry9o0M+LTmqfTQnEro+qcuTVaDVQ2/hlSMkA=
X-Received: by 2002:a05:620a:4710:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e62adf8d9mr360896085a.6.1782827827059;
        Tue, 30 Jun 2026 06:57:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:92c:b769:ad1f with SMTP id af79cd13be357-92e62adf8d9mr360892385a.6.1782827826465;
        Tue, 30 Jun 2026 06:57:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288b082e7sm133823666b.0.2026.06.30.06.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:57:05 -0700 (PDT)
Message-ID: <53a2a17d-8400-42fe-bac2-6af997b5ebf5@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
 <20260612-shikra-dt-v6-3-6b6cb58db477@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra-dt-v6-3-6b6cb58db477@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfX4ECkgF+H/s3U
 HOlRyb9yEpgVmS+JCXynho9Jpm3FTUOl1+tM0zAV9IAnRJJyFX62ARymYCYNth3EjaL39lkmm1W
 axFCeKCUvj/ryxPlu1FC+6BxVUu7jxc=
X-Proofpoint-ORIG-GUID: yb4pg86SKHDJ0fWKDkodzD62E3NLjahX
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43cb34 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=djcwQD5uGQ3GNs8by1sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfX/RKTkLx7DwCI
 +1SKfH8DHpdBtJ9YhKgkn4AfdWrvzmcQkf/+04PYJV4d/JYmob7l4IsD+MTBvWoSlZHHkbOB1kD
 m7/GH+dKmDqGHrs944HU6LENajsfSVD8GopYKSmpyzMi7k5y7dyHqXVoPEOpXat5ovxTfvHQUgB
 WgDt+bBXT8u0Jcjs65Rh0qYH/Q9lDl0nKf+Hmo+luzkaBJOm1CC+0z6fpK+5Q4bWH+uHix2Q9xS
 3HE55f3qiTHZJbZGiWQpBBL5RMS7z+Nj+dzowBX428yMssnpA9jIGHFnB7yLmJvZwwWqNodipRL
 oyvXwqJ9cRJbbxGoD7Zm+yCvNlVBL+fi0+kw5X5eb0643cdv68owFTn4T3axT8UGZtzV6odgKeR
 ifZhTX/pmxfrZVspMQEyJc/rpZS/PHELR66PDosBbT0vE0jmedV2cSc4DRoleCpU7E0CTCLWUwO
 ZO/A/2VuuyTEuacZ9eQ==
X-Proofpoint-GUID: yb4pg86SKHDJ0fWKDkodzD62E3NLjahX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115456-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1056F6E51FD

On 6/12/26 7:27 PM, Komal Bajaj wrote:
> Add device tree include for the CQ2390M variant of the Shikra
> System-on-Module, a compact compute module integrating the Shikra SoC
> and PMIC for IoT applications, designed to mount on carrier boards.
> 
>   - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
> 
> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
> peripheral definitions specific to this variant. Since PM8005 regulators
> are controlled by rpmpd, so disabling the pm8005 regulators.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

