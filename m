Return-Path: <linux-arm-msm+bounces-101269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFj6It3dzGm0XAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:57:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42603377264
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A485C303B5CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 08:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E3A3C7DF2;
	Wed,  1 Apr 2026 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGSsFyzy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELVNb6Fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610752DC783
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033777; cv=none; b=oz6SEeyfn+oy5FXjFgi/9hKxcqm6EneCZsUfNdmYqCmsEtLJAGaqMI3qSqFdI8e5wQABBm45AaYw1s81L85kqmW5k95duxVTA1eYtlNiybpjxuqVUuE2LuaWQojSIOn4CZkqA5V5owrc7XLhfDiwWD02ewMRgU7SwIz+HPrTdTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033777; c=relaxed/simple;
	bh=Ut126lbH6NWUwD1lxUriuneDo3tZZfq0N3b0jj4pHt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLU3oIhRsmAdCWVgZAVCBT+FvKYVG9uo26FPMmfcpevr2BlWlDzcmqp4nWbhD/AMINJyW1Q4q/aE9+HO+UdkjmbhT5lMKSfY7KP+DcLC2V/qQ/xfGHaesTI4Z6n9KmW8I+TSJ6LY7/CFiskOMnYCMX8NvZ2i6ASummB0j3AeNNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGSsFyzy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELVNb6Fr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171cnG1285913
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 08:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMCDogjDonjJXSSoXenB3Esa0J2VQAOnQzjh6khvW9Y=; b=cGSsFyzyCZG43yUX
	XIAR00CfiCrGPl7V/WRV9ZbyCwFlx69gxYWd5EPHjdLRnRGHD5reMOtS3Anpubgf
	DFOQlvIVP3C0eEDYWEf/4+5RETYpnAS9LQLqaXSci1lG1VKEHp9I6uIU75WRd1rT
	Pde8UdjFkrhXC3zYR+OGJqG9LpMuPBUmIkdS2whIyF7ztvQnJXTYhvt7iTDCaZmy
	RRVewhpgF1ek27F8yPbFqPKSm3o257pM1DKzbz0PHx3+zJYll9iWCHKNAjARi+T0
	I4F4icZYVbhWreIkXsxhjcI8IfNFohZGkNEK0prcJy3phjf27lwjkjHw5EaOZwRY
	+ckMbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3re0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 08:56:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d1d81dad37so11697585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775033774; x=1775638574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMCDogjDonjJXSSoXenB3Esa0J2VQAOnQzjh6khvW9Y=;
        b=ELVNb6Frqs4JCQajPNGPXQSy6z7WLPkhLAJssigTlkqmx7YKExlLmnHX683p7I3Jl5
         7IZeAhgsN5TGgWYbk2cy/qCglKaSRAgNNSl1esxpnUU/ZM3nVQ/7E4LhQAuqQfXJ/vj+
         RqyVp5UYWvXJkU8iMobvEhw07cEW69hszVykiATeQB78WTMq2wdgyGvT49nRN+x5qwiB
         YvfwFFe3WwSrc5iQaYRb/cdcumCJA/b/lp8EW+fi60Gh34sl9ZEOsZ7A/qKQi9Jtdi51
         8cl4N3BC6sXx3L9K53jVuUqGdRqgDWW3b3Ijhy5PSLkaZisOgliyVWShdcevRIeAZtTQ
         X2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033774; x=1775638574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMCDogjDonjJXSSoXenB3Esa0J2VQAOnQzjh6khvW9Y=;
        b=H7LHvunsYt2u9UUqru3xfbu8PODWvu5RhmgOsSt2IJvK7dHya/PeNzTCbD/Iah8Mq4
         ZGAhp+4JDZR23lIIvJXwDPoS7l4hbwzeXc0fxKmut0BzPIOMjCixUVX27Wc6o8DztBhB
         k9ooVkV9Nphi8OLlJUmrLnn/jm4j9VneNM9vA20mAu1HZ09De3R3gTK5hgAY85ljKa2W
         1WeSaVNZ9OAnAuxofEzj3owx7K0IIhWS0aH822kwYj43WfTYs8Ia9zAUr6Hg6NtnsCtP
         pDOc/Lgoiv5iVKuyJaZY7+1o+AdcpgNLND6FQwHpUXiSDL26i/TennlKX+W2yZNjqI6Z
         EvDg==
X-Gm-Message-State: AOJu0YzqT9pSmL/SfX11iF+cyGW/8n16T1uxT782L+gyWY3DI+9d19pH
	7QU5ntSACgpfWV2myVjrO7JsXWYnHYZJPzp3eKsyERiKENA+dGiPM3F1jb3z49P3CQr7DvvAJ7c
	f0HUpy3oiVZrrNRobR3bOCc1niV1LRrFLet4U1sWVf1GTbXS3Ray07ZX7gUW/Jj+F6VSD
X-Gm-Gg: ATEYQzzLmFaagCll6TEHS+nnhnx8v1aQJCaaEJ4Cvgri5LMnTjB4GX3cTYtpCVMFV54
	bYY2RqL6+XxRnfchHjFoPC0s4wEnGFBT5RHmq/72aM5In9VWZqR/XlRj6ePfjTxIt40hbOxwMBm
	kR+HvL41XRSHdzoF7lUfBPFfV7t85iltOjtmcpknap3xOv0k9/faYZ0DMDtEaTL7ar5/j2ffib7
	XCcmGtAns/JodCFgKhSD16B+yMlxy8P7lPPXVss87tJ4rpzZk+owmlbyOKGXI3m915F7xn3Q2Ym
	q5OyrBGYPxPharO78TkPmTXH03y7L/fV9fMOQBQXQ4czWSSwWBTth5eiIrxQcbvfTnz3zEFeidi
	IBgBAvS3esG0dr05YajE4hc+J6eC3h0mKz9ikBa8T2rqdDiWIEOKFM0+jwLbnlEsTsC/V11PE1k
	5mIu4=
X-Received: by 2002:a05:620a:31a5:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d1b59568c7mr351963185a.0.1775033773753;
        Wed, 01 Apr 2026 01:56:13 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d1b59568c7mr351961485a.0.1775033773276;
        Wed, 01 Apr 2026 01:56:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c07ab1634sm2394390a12.16.2026.04.01.01.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:56:12 -0700 (PDT)
Message-ID: <c823d6e1-3ff9-4ba6-b972-db0ee737e0ba@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:56:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add qfprom efuse node
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
 <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69ccddae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YkLeLEPUqZoZDRCJoscA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: uv7DRY9d7BITToG1RLxNeMr4tgpzXKae
X-Proofpoint-GUID: uv7DRY9d7BITToG1RLxNeMr4tgpzXKae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MCBTYWx0ZWRfX5688KFQiY8vp
 WsxyORHe4wJ+QOlIqgG/yesRfcZCJ0X6z3mivULYKXIEYZEgrCObnF2NRjI9x/YisEINTnQHT6B
 1MyNWfXFJKAeYdU5yPwjwbxjiQOxrbRlqng0oKPz9rug4sXPkB/zTZ8ExqTBJ5xwqKsAn81vCS+
 uZvyvx2MJ+Y+TmGu7Ui885JhWKqjxAjCpSImrnAJunOCm1a5BYPHw19xgYXMEMPqUtLRJqdBF7T
 opPRkMS3fQas4vdFHqT+0iGqYpwg2EpC1UwQrM+KIMwZz/CQOS3DfL2fTPlmcyRAskO76EjqJU3
 RJjBlkuIzMxF+cQP2Rl4vD2gWK3tlbCX9AFInzKatzb0x7hoIB0k/drx44Gg/s9vCrbggz0lbrV
 o4zdwx3Knz9usAHLmlAH5aKJKNQafZEqL7KerwKUmznLYPL9976rCJWpNIydNnA/gfiFVO/QtWw
 2Lb8AK1RVYOYm8zAzTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101269-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42603377264
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 3:54 PM, Pankaj Patil wrote:
> Add the qfprom (Qualcomm Fuse ROM) efuse node and gpu speed bin child
> node for Glymur SoC
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

