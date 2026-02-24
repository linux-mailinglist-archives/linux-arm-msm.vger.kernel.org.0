Return-Path: <linux-arm-msm+bounces-93993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAzpCTionWmgQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:31:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9F187B5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 14:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8783B314495B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 13:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D38B39E167;
	Tue, 24 Feb 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PUwxlPJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxZP/cnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F739C65E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939410; cv=none; b=M97T3Ls10IXj0WMzEwwRCJ47kjyrxXBendHazaWvMM5tmeJuylsFQNdBWPylKA04opdUMxhQjsZ+CDD5G2ue5Vl4+8SCHJ+4OI+yMTprWtCtt5g6vgpwbLFbRsNGUj4PX5SHvn70xaRzEffIbYmA1uvKz2oNqto9beAFsf6CEes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939410; c=relaxed/simple;
	bh=xvNQHAYPnrs+AdA6GZaU6qY9Mj7Z8s+YlAkbVDYTaHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQvzkKsHB2bd+uNKzPQ/YhnT8q3CrkRNUY1JY2e2VlduhtJMz0vtUXcG5pyzYEcDsdCHebhb8qvr3WLxotyr+J8qmnszg+aELOXffG+ZLar9AF7Mb4fjE+aWrIGauT71SBym08ncdZhDyUuKUIeGMQjsDFhsezgQyZM6WkSmknw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PUwxlPJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxZP/cnu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFT2f3324732
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TDybijHzbfO0piRE4gzPUhmAdkROKmlgDLEadKb/BR0=; b=PUwxlPJVuWPbxQHt
	1iy5CuRm6um8pmEXThr/G3TnzW/B5G0uvejtURsx4twRFRFDoF5D4ho02eeEA0Nz
	QfupfQ4G8VW2TOrsgWQlQ6KuySEKb8YRWt7fA14gokftFB5CF1q8VCT+4aSlWzAX
	N/raBpB6dWMylGqGLxXwWPLjgA7HwbyQjnNbS4+9Ii0oxATk+z2S40DRvJ9/U+w+
	nJ0TJOr1okAuoqg5K+hFTMQuD3C1jYHIfhi1CkaGNRq0E8yqX4iQNPwoRSyJI3qY
	sAWje4rptiborHB529pnNDrSWGG/znKXOH86Z5HA+EXhjucsE7N0tRzFrbi7qW5A
	X34NDQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y4b0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 13:23:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-505e8451617so66399221cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 05:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771939407; x=1772544207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TDybijHzbfO0piRE4gzPUhmAdkROKmlgDLEadKb/BR0=;
        b=GxZP/cnuYO5d0rEZZbtfkcP7kpMke+efWV7qUWs/tn9Z9HnuaDEGYisQHMDoaoAbj7
         Xi934NtuG6XsaVJkA0qMYz/dmlz8zBG0XvEBIz3nR1YWMxkD6hegNa+9z2YDnOvh6W4O
         M3789Btzlw9mJzGX1dDlPZJp0aEqH+cjy0myqONpApV+mZ2dG3X3dYKPCV3DwGaLhGFh
         SvqYIBRfGV5dgs+ybEsVXq6ZhzU42TVbg9ac7AF3sAUCru2bkIaBpR+mfo1wsOB5dJHS
         AwOvrmD9hmzb0yVAIt8ld1/CV8JzOsOWkbadVFmOfClySzac6LQQm5WzLk9uJCUX9QWb
         bLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771939407; x=1772544207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDybijHzbfO0piRE4gzPUhmAdkROKmlgDLEadKb/BR0=;
        b=ZlK/vYyl3flEhagVfVjQ74ntB3YIaU4DbTs12ecCZ3Ua8p3wTf34opTNPf2ncnrSiS
         WaqcXfqAwoMFOgZzTtVwQMP62W1FEV4HY/U08Q1qVyPzEeZAHVUGya+n7HUjXy4uoRrx
         tnE0mze3mzy7O00DdvU4RANDeJUbBnvnuKZktZzIhjn2qUOnUDM9ZiL0heStgdBPulw+
         oOSRle/GKSnjL/cAHo15MY3BqsYZ6mZCTcWO9oZ7VMPClyARJ47glt6rMO9OSBcITiTs
         q+srvBzDTQg4aHfTTlDMXu/Ph4MTrTz4zLuSt0cECjAwvrQ3VyInClWFi3So5OpKXJpx
         t9AA==
X-Forwarded-Encrypted: i=1; AJvYcCWiTOi3XeRRdtjlaIG0KyqDYl50kIWPTHQ+FW1mBhigqkqGMQp8Qfn64IAE66gwoQ8ZiNyFNd/ZL2VBsD/y@vger.kernel.org
X-Gm-Message-State: AOJu0YwfadggZJQxhXTRWZpEObAY9Axf0XJlzoZtwAx5jFztGo4PBIRZ
	F6ADzfvHfnxlHK8pYyQllu0g575hSf3cfuaj77nVSz72SOfP9DHz6lKLz1factO3b4CvWcXUIhf
	Ed/UKqjahR3l4wTS1R15KT2LVApv2XTeZyxc/w7t2lKhtqtLMMMyeKIIuvqZu5QWub+r6
X-Gm-Gg: ATEYQzypmhpZz3Ua60mW+a3o7NjKz5dtI/xERQz9r+i/hcFf0hTkXWCzBCEJGaJ7NZw
	QwsVvxdG5P+FP8IBfyoj94z0igGaaLBjmvwu3a4XxeDl+yq505mJm0CURE7ohcF6OGjZIP1DhuW
	JedTQkRkMxbpvhfkRgr6npQTVKXrVHrKYMdXZ6W9EcSsMHEVRHI5F9aRRVz0meBuezjSlVnnFEq
	r/40Z5JfM0r08Guf+SB11HzC4tEp1AwEyPAN35qIok7EvC4T8/P67ljTiKTPXpbELEBMqmDk1+G
	0AnzUjRR99I61JaJuft+UMCmIfQBCHchV3orBhOP/xsvtkWAocmZG6J9ld7yK28M4zUjjfyOPtE
	1Xs8qiA3NPmt6MQwEQCQwEBgjFGBkVSOWAV+m3TTPG6Uym+Iwqz2LfeVQY+N1R1S0KyIv+THXsm
	bbRHw=
X-Received: by 2002:a05:6214:470f:b0:894:9309:a2b with SMTP id 6a1803df08f44-89979c5f0f5mr117156296d6.1.1771939406807;
        Tue, 24 Feb 2026 05:23:26 -0800 (PST)
X-Received: by 2002:a05:6214:470f:b0:894:9309:a2b with SMTP id 6a1803df08f44-89979c5f0f5mr117156046d6.1.1771939406395;
        Tue, 24 Feb 2026 05:23:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9194f3f6b6sm75932266b.64.2026.02.24.05.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 05:23:25 -0800 (PST)
Message-ID: <df0c6c3b-3276-4d62-9dd5-fe3e3ab629bc@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:23:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-4-loic.poulain@oss.qualcomm.com>
 <01804171-a9f2-4509-afed-d222c5d06251@oss.qualcomm.com>
 <CAFEp6-0+RKYLJ9pGzP1f9rbHNFNG+cXhwCr+=fwDAghrbB5Bjg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0+RKYLJ9pGzP1f9rbHNFNG+cXhwCr+=fwDAghrbB5Bjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEwNyBTYWx0ZWRfXz1WzIKmhnbjC
 AmNn2D6umkYgmUz2K3uADCzYNxUrNkLICJbxTZKq9AjG8aCjt1hurcsEwzoJ3gnJLMKKuIrcFI8
 Zli8bhlc9ktgaXZOhdiRbJGUvSawcIU0yDPzGXMQDJVJHrMWt3TMHNR6T2qOfYeCwOK0rG8bXci
 fDKVztcZ2P9cXTGF/0440wqelDRga9ZkGOBNkcGrkJbDzZITGtQ4s4/ogNqQhan3DZqurFnfs80
 e5k4BM7G3Kf4G9rx+kQRfKpCWQqDb/nrg+LTYQL6peo+kwfq12An1XdMCOfjcqhBIooAhR/JpCH
 mO6150GNuLBadQ2mKaJ+AS7s/1y2CMBvNODC/v++6Cezy8bPXFAUdMFKnUseuAkftC74HWW6H7U
 MNue/nc848Cm3m4bc7lgZ0CosXOVeca9G2nU+Bxzz0onqT8E2O6kp2xtonolCfq6ND9iJUL3Ym3
 +zy71ighGS0T7KTJ4CA==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699da64f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JWGDsRQyJ2jdF5jYV4oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: lc0ureIHkXixDFRaw_dhyb-SKUf7suku
X-Proofpoint-ORIG-GUID: lc0ureIHkXixDFRaw_dhyb-SKUf7suku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93993-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7FA9F187B5B
X-Rspamd-Action: no action

On 2/23/26 3:46 PM, Loic Poulain wrote:
> Hi Konrad,
> 
> On Thu, Feb 19, 2026 at 4:46 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 2/19/26 4:27 PM, Loic Poulain wrote:
>>> Add support for VFE PIX write engine, allowing to capture frames
>>> via the PIX video device (e.g. msm_vfe0_pix).
>>>
>>> Tested on Agatti/Arduino-Uno-Q with:
>>> media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
>>> media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>> media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>> media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 field:none]'
>>> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>> media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x480 field:none]'
>>> yavta -B capture-mplane --capture=30 -n 3 -f SRGGB10P -s 640x480 /dev/video3
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +     if (client == TFE_CLI_BAYER) { /* PIX */
>>> +             writel_relaxed(pix->width + (pix->height << 16),
>>> +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
>>> +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
>>> +             writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
>>> +             writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
>>> +             writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
>>> +                            vfe->base + TFE_BUS_PACKER_CFG(client));
>>> +     } else { /* RDI */
>>> +             writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
>>> +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
>>> +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
>>
>> Were these default settings (prebumably "dont care" or "always max") valid
>> for RDI? Would the ones you set up for PIX work/make more sense indiscrimately?
> 
> That's a good question, the configuration above is the typical setup
> used for RDI paths, and it matches what other drivers generally do...
> The RDI path traditionally uses very loose or “don’t care” format
> settings, and simply 'raw' dumps everything between the CSI Frame
> Start and Frame End packets as an opaque byte sequence.
> On the PIX path, however, we expect at least some level of processing
> (even minimal), such as cropping, plus later statistics... For that,
> we need a 'description' of the frame format.
> 
> So theoretically we could describe the frame more precisely for RDI as
> well, but that would diverge from what existing drivers typically do,
> and the benefit is limited since RDI does not really consume most of
> that information.
> Also, I think we may end up dumping content that has no line
> delimiters at all via RDI, such as sensor‑generated metadata blocks
> that don’t follow the usual LS/LE framing.

That sounds convincing. Would such data be the hw-design-intended usecase
for RDI (with the pixel data going through the full pipeline), or is that
just a possibility you're mentioning?

Konrad

