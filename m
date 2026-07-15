Return-Path: <linux-arm-msm+bounces-119209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MgfkNCpgV2qzKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:25:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A3375CF5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:25:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bg4MieEJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SIxUylex;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119209-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119209-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE4843005163
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C199443FD23;
	Wed, 15 Jul 2026 10:24:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9720443FD05
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:24:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111081; cv=none; b=mnI0yUvwfyHyf7ihVcX8jUp87iizYQl3PDqzFjmay4upqN65KhP4hO7l80UmmOXshz3T1fDhcvFnnOqAncddgMMJG+iy4pwVDiyrTBcuWzMQKugd6GG6MSx6AAei0fFMEeG2D/0jBHcigoYeqpa3qTLQUP5ylQKdiQ1GDKVf0gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111081; c=relaxed/simple;
	bh=8Uv88TQVC/hVQ6ukLKOEoyEFgbMJcTvJDn3XGybrsLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHYs5AKcVL4fuxVD1j2N//o5Somxe5K1/qIXRshTVbQ+BkHhsE3dm8G7j6caaboOHdzgTU0juMVVhgjIz8sK4VumL9p86bNpcVs3dOu+Vc4R7MPCW0fjGQ/cRY8NrcY3RAs1F7Y18EE7+ilq1q+lMejJ+VD2Y1HhTP5jwMCV2Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bg4MieEJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIxUylex; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F92p4A160854
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJBx6NgMRYm3DwbZzCWuelI1pqmUxLZpzpOLKQlC+/I=; b=bg4MieEJ4HMLznwR
	M7OcLr1PGdzng9O2fm23TE3o+vJImnddolRJ3/slBTG1vldKUKU414tVvtZrCcLF
	dgz2B81PGro355OCM5zNEAzXWN0MoNG+/8uEKpGUETpjASTcWi08B7CARvfi0Lo8
	ng2fhOGYoympn6P9L6uLvAFUgyiwMMQMIGCpH5kn9qKQoLju0nNbZ0bQIW0VYzF/
	Pb2Ve41tPYV++8N44syg3d2Q/udvd2olaKT91Gz9KuIWRuxxw6WJVoqWRY5WRR6M
	ohsYfj9UcROd0XzO4NfWU8BeKLBZ3lBoCK9lKqyupdshBigGMI2G6XZO9hR5YjR2
	Bfo8gg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrj08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:24:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfa45b280so12434561cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111079; x=1784715879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJBx6NgMRYm3DwbZzCWuelI1pqmUxLZpzpOLKQlC+/I=;
        b=SIxUylexFRvu9ieQv9eK+x5n3jBxlWcZ7P6bFnitNr85Tw9TR+XYM1teYdOY220LVD
         xrEIZy7n6+Nj9D5Mb/jmq2juDsOzFpIOytBUDAuDQb6TMKPT46OeqxMycsD6/V0fbCUN
         5Vsmiz4UkgHGE18knJ9ajX2je7/UODwox2lke797eqqbBtfpEMHtDLOIeRRnKru0Nqqh
         Wf0rClKH27oC5/DWFZ04TIsmFi78H+aveAgS4TGkHuQ7oc7UA2x12u8SfbW3uenbBykv
         7FX13fjbY1FZKccbmMmmb3kz7uXGizQNCR31IUj2FZ3uJ2zuA40/za4rh1Q8ISH8Ni9s
         bTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111079; x=1784715879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJBx6NgMRYm3DwbZzCWuelI1pqmUxLZpzpOLKQlC+/I=;
        b=h8FURXIrgXcwxcrBbfyOpkzCTx/8d5Ra4n7/fcKmvjN6GkR/jO4yE15hoBFw6pkof0
         x8QoFDLiItJCoVeW42Mws0cR9zVWEx+DyeTTXSE6Ks5K9Iz6o8M6Vi7pMxCOX10nVT6k
         XvxaUar7Sv6qOvW5crHq/wgGlVvTcE91hMEM7kGVWZMphMTirFHF0nrch1KJFycOfOfU
         5RkQWLyBizxh4hQFdS5YWkoYjrxgBt50J6POnytUjIqFB+IgmM16U2ixuXJw542ZTAXl
         eu4+xMFCFZGmUk08AQRf9ZQhXeiTJoVcdBKVF74h1sroMc2VshTaB25mN185uBLiRW+7
         3ENA==
X-Gm-Message-State: AOJu0Yz/x3s589IMnHuMmrPuwiV/HBFY/suL8RVrz9WYaEkZ13ESJ4D0
	a7PykD+J+HTJCyrqgi/GpczBRSWr31dbR9wsrv+RKe0RCR2cra6p613lcxo/zgn7zaQZllC7WGZ
	KztUc7W2MCQ2gCfizWUOjcaeWHixVMvjXLGZCyoK6jZ7FcdfgfoDApTNr/r9fLvaZ3CEc
X-Gm-Gg: AfdE7ck+2FP5O+vrxNLlwPtSv4Rn7i07obY97hwCkXAj5X2tpL20Ti0/GNr8qpOH6qY
	Rjo0R551gm10YS4tYPX0txqRB2ibirdDroz7R/rgScM2Upe6ejnxS3RRMhD/1SzGhwBVqRosMqT
	FPOdOw33YnmR+Tz6pWESNoZsORgsEFxhEZwtFkwQnmJSC0err731bNfFvEcdONLpE3aXKDyN9fR
	OjT4QgQPYOus6rMmqfb7kHdaTktyJJH/8C2iUYaaEhU1vY0pTF3xZuBUwvYegk1ezdjRmkuhhiD
	1wqIRI5WYb03dTXOCDNSVCRmOiYx87jg0apCDX5mOCZFIRd5UmVSsw2iM78HYo+4uGW6il71XXs
	eaxaBs5+sjOyfSf8Lm392JAFZ1X0KhBjjqqM=
X-Received: by 2002:a05:622a:34c:b0:517:5d21:9899 with SMTP id d75a77b69052e-51cbf1f3f75mr134937011cf.5.1784111078929;
        Wed, 15 Jul 2026 03:24:38 -0700 (PDT)
X-Received: by 2002:a05:622a:34c:b0:517:5d21:9899 with SMTP id d75a77b69052e-51cbf1f3f75mr134936791cf.5.1784111078314;
        Wed, 15 Jul 2026 03:24:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871262casm293366b.6.2026.07.15.03.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:24:37 -0700 (PDT)
Message-ID: <fa804ebb-eb99-4135-af99-7c85e1c381cf@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:24:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the CDSP remoteproc
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
 <20260714-dts-qcom-eliza-add-cdsp-v1-1-525e757a23b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-1-525e757a23b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ygvh8o690Egz8DRi4byVdai7_cnMUHTJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXxdOWJT28OmMv
 FLogbE5dvKlZ0W8NdtGZKs99yBOwaQLnfShOYw3fMeWujLo66XMuairEEg4OC27VP2h412olpfI
 gz81rwxnMagfcW8roojZbtxiZN+C6c/F1NIw0OCY4rHOJEpjy5DJqvTkAtUND0md3W+lOf3YHYm
 RBFUV6/WBTInxy4WXDALYlNmMvLCYo1OkwRSrEv7WmW6ZoldvUWv+JincRNiYg+ZP3VuOqjkUZV
 uTZvEo+l0roV8cwGsssa1WWLnSzQy7VPufjC85NEVosIBVrE3R7z0fwL1dXjYhnUUJzCXKFyYfs
 HLfT/9z1ytfJSng9nS07fiFkdQ7nmOzOmMKeNPOxz+XDg9MKSith4Qil4ONVV22bI+37rzxkfsV
 Iz74m1XfQkOJWPvtpKmgRTbDQkl3706agPriOdhMw7AKQ+rVYZzsfFx/FHYSWOmV5zsRauyv8vD
 esEHlXm95k1GKIWBHXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXwfU84JqCLAw/
 zffxqISdg3bPrV02HFVC8k54oE/Rsv2NzwZPi4hSAcCJD1Y1wXBBvGFpjhBcm+P14RkA2F926w4
 KwXEjbm1p7a63+vQryOh2acvn1n7KxU=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a575fe7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=T3cQ91Bvcxg1os4lQNMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ygvh8o690Egz8DRi4byVdai7_cnMUHTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119209-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2A3375CF5C

On 7/14/26 3:06 PM, Abel Vesa wrote:
> Describe the CDSP remoteproc along with the related SMP2P.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

