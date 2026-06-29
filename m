Return-Path: <linux-arm-msm+bounces-114834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yceICuQAQmqQyQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:21:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E66D6008
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:21:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XWLrmMem;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iMtvpbu2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114834-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114834-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 341AD300363F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4166F2E9729;
	Mon, 29 Jun 2026 05:21:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888312DFF04
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:21:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710498; cv=none; b=uqDU++fbAlPc5QilxeV8i9dWCM355qLx1OUOdJYiXP19b4S0G0bBZFS6SwS86Mn5COZ//6J0/Rbf7suegGPHjOWDWwRBq9cIWFA/ggjt425y4fEwUPOwqMvQukcF8BejOWPxBl5AynnQMbrtValD7g+iVyvtbLlfvSEU+DIqs6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710498; c=relaxed/simple;
	bh=hf2YvkCQ2+656NeqJ7JOZlD5t5MHvJmIml02HR1n2a0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G8KbaXp/iJJgqTf9YYejmkxu6sp2e2TMpzK2J0al3Dq/mZcNh7YItNu9V00GO1wsl2TXYtcjjA1D0Ac7k5m590enfO0QQhO7WCvDTBhXGajeZQd46rK3GC2BY6ntboioo1bcY9eKCBwLoMT55RxTNjtYbh6pzL5J4STLGGt3Iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XWLrmMem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMtvpbu2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHKe1771453
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	topQkWEwcoqTN7MCwL5X+qwyPKw5DcKVugONuTUv8GI=; b=XWLrmMemubiWq0Ki
	5T5ufHvkCgvHGXku6QaLXZuueHswsXbuWgwxTUpfDAMnEzH6pRa7udnOFIZ+Jvnr
	5pCRH+CSta8dkMESeFc+bXqN5Kgft6taCLQMWTsf1R3+D6X3jCyuPWL8Vo5VgnJT
	KAsJjzv2DK7g9cv4+OYBd5/Vhk54Z5O+X79BeUXz2rtgtcUjFOFFERTiHMqjszAR
	7uZIUMGK8HXtS4+SPa/hR4FYdCAx/sgaT83f2bHUYe/VmTP8YNt1k/ehNUImCtaC
	r2+VBQ+fas1fyF46zFXMJeBMT8DFRqfjEJxJQu6hPLKSpVc8krTFXc6IkgcYjY4R
	7oOe5A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumhqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:21:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c804e38c65so32689735ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710495; x=1783315295; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=topQkWEwcoqTN7MCwL5X+qwyPKw5DcKVugONuTUv8GI=;
        b=iMtvpbu2Fck3p716N2XHLhKbhfX2cvaybd0oMPGCCPHps+TuYOZezlmYMNMY1rRv7Y
         jmLZfhfgrfjhZq+aI5Ca+TxBdPmkS7ehjD44NY6bPj6996r6rfg1aZwxNNkjna9GcRlK
         FjUgrwUVAIZSef53zb+fEUU98AFifkJmM7MRitHEgOEGIO7qm1Mikgn26GOAB4zcdq2Q
         mnjxOwcdGeaU3uXIt70KH/496YFmCUkJ35qmFNiWNmnhr/snQmJjxmrxwkjI4D2gpNqh
         oXTUmIjTLUnPFkarYmVXH2n5jBVyDz/uHO45avtGcoynWjp8IfCbLl1528/b8JSQr3na
         cG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710495; x=1783315295;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=topQkWEwcoqTN7MCwL5X+qwyPKw5DcKVugONuTUv8GI=;
        b=jeMnk7lzBD3pbMgJYIBjkr5iM6x7BouX5XFB+kZmL8rQ/nphsfgbTwvcWLfs7E3hu8
         f0JPJoeYQRXaUHQnN099pu96x8yqh9uHc+OGcJq16hZzqRkgYTrsAX9B7aVEVMQklGGk
         fEbLa0ANKTZbPY2SgMd9c+1WsCGKHHbxn/t0XJ2ZyExO7yigv8WA8jSuvayR7p6BTxSp
         8PUGXiwOucOzbOCezBVcms/x4O11isQu5skfLxc8fPoznnUHsaj3mwewctSzAs+QpZ5L
         Vlhngv7SK+0bqXq9xjN9frGax3PztwJgcjmIU1ypx7gmhD1Or+h6lFXEtAmFEnsBSmPh
         LWaw==
X-Forwarded-Encrypted: i=1; AHgh+RqPUG0gh5mLCCi1z8DuXjQvwa3VEMfNu/i783bxdSKroZph0tChI/AUeUZC8mRWkIMZBPxJ7pc5T75sQW9h@vger.kernel.org
X-Gm-Message-State: AOJu0YyQWfmOwYTk9yljh66nNXr1Nh2610gFSfwemoyhCRMq1PcamHvL
	TrK950WTqjYDzyCmGpWpwBTsWct9IUnxGAPSNwI6sXgggSmwUWK1kc9xydwnuGgHn6PRHH8Zx5g
	pFID7qzuZNBCmSf1Bs5eavl8bFxr79nUPcvC4wkQlZMhwpFLtau7GlzH9k19+fzKeFpmW
X-Gm-Gg: AfdE7cl6u/Ho+jWsgkRV/1GUNua1d0eCQO01cu616Ct+8r2SmZDioYAVcNJR50bJU3P
	ABs0kuWrMYy04gjadySCjmPlZCQEnePlUosWDm3rut+ZVmNjap4oeGVNDrTB9N2QiumreY6fsjN
	IK3xuW8n21Su0Kn691JUckRjgL96UokFkpUscjNfPDFdLRNZ3UKn7qTdBC1A79tyOgnfxK01An0
	YbOMzS0HYsk1ZCRGBnyG9aszjdu+xFURe9D2f2zZqhO5pzyi3eV0TvA0+PaXFHC4HdNKhjzvwx5
	iQHUuYWvCez+xoQtKVDeR0cpfj3HY/UoGlRgrsGGewkvOhKGuDccJS0BmbvS7iy6cvJztNGAMKN
	s6m9m8FaAjDiwi6kW2IZkOevs90RbEXNojFGsQQ==
X-Received: by 2002:a17:903:191:b0:2c9:c083:cd49 with SMTP id d9443c01a7336-2c9c083d409mr50062435ad.14.1782710495148;
        Sun, 28 Jun 2026 22:21:35 -0700 (PDT)
X-Received: by 2002:a17:903:191:b0:2c9:c083:cd49 with SMTP id d9443c01a7336-2c9c083d409mr50062205ad.14.1782710494705;
        Sun, 28 Jun 2026 22:21:34 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9d886668esm25607175ad.58.2026.06.28.22.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:21:34 -0700 (PDT)
Message-ID: <620be193-f49c-4f8b-b025-51f266f247ca@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:51:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
 <foutgm5vhldz3verik2mje22nrnu3r3z72mxah5wmmuoro4l2q@ud3nbdgctpjl>
Content-Language: en-US
In-Reply-To: <foutgm5vhldz3verik2mje22nrnu3r3z72mxah5wmmuoro4l2q@ud3nbdgctpjl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m4OqdDQId5PT9MTcWrECaFJk2ONFyC0v
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a4200df cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FQhjQoDDPVDRA2-OVkwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: m4OqdDQId5PT9MTcWrECaFJk2ONFyC0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX9UI7RJGO+Ew8
 LQygwxTtiqGx8Q/mUgM4RRbtG5zliyjBBxFVFdhzU4jRwNSjjuJ0WdlG4YzQEdI01MugVyu8rBc
 pVhL2O95Enj5wPLeK3/fs60i3nyeB2/hC7ilm9Wi6jWmv8rcv9V77Rj1VDR+gmjInOylb++8Iqo
 XstWJ9DFNB/loE6oo9ubGn/7rLuhU50Fqc7c2DtD74AUyuNgfwWnNdUyp8w39Twdy9STOvQ4LK3
 tfjgnww6ii0kkKlvBGs7tW4PBm9YsZzDdtkBmrM9PCq7oOoUwF516AaIDDv9FjRB+go7odnVY6X
 bqr8yXuAZf6c0fZ0yB1qyV8ofEY80H+K6Fl5V17n0SLJOa11BDxWEYAH3LzSLSx9av7RW+iAMR7
 EJzSrncwOAIzw91F0rxAt0AmQQ1SY3Lsd5oFc7dp2BukzPzAMW57fgjwsLZjx/nsOXjTFCs9L/R
 UvGNCHzFrAOY5jdHwGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfXxcIPOy/OXOAg
 ZTIvHglou7c/+i9rKzl+eOjNkkhiYPvVuO1aMq/bSasUC+KB5vrYY9zXunw0GQ92bTFaeuQVv6m
 6oAUrS9m6BLIpP0IboNqVCSuVunfnXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114834-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B52E66D6008



On 07-06-2026 04:48 pm, Dmitry Baryshkov wrote:
> On Fri, Jun 05, 2026 at 04:56:31PM +0530, Imran Shaik wrote:
>> Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
>> on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
>> across variants based on Audio subsystem enablement as follows:
>>
>> CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
>> CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
> 
> What does it mean? How does CQS play audio? What does 'audio on APPS'
> mean?
> 

In the CQM variant, the QAIF driver runs on HLOS, hence both AudioCoreCC 
clocks and resets are required to be supported on HLOS.
In the CQS variant, the QAIF driver runs on the Modem side, and the 
required clocks are handled on Modem, so from HLOS only resets are needed.

I will update the cover letter with these details in the next series.

Thanks,
Imran

>> IQS: no clocks/resets needed; no SoundWire codecs
>>
>> To handle these requirements, variant-specific compatibles are introduced.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 62 ++++++++++++++++++++++
>>   .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++
>>   2 files changed, 111 insertions(+)
>>
> 


