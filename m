Return-Path: <linux-arm-msm+bounces-108203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLWOJzEZC2o5/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:50:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72E56DFF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 279DE305B45E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9100372EE4;
	Mon, 18 May 2026 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2oPZ/Fh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLul7rXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5074036493E
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111864; cv=none; b=lW5YzW5aX+5MVkKkwxhv1vFmUPINnuEXDkqji8vOmYAnmgi7GShPBqeazQe82WXTaku5QhiMn0xJkbltMUk9edUCwVpFSHSSAFd0pJd4Was+wpfmjo2MW5DPTfdzO5U5YGRXzUwtZjljLkSO4pZPyPr160T3pzQf6Eq5O6PpcK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111864; c=relaxed/simple;
	bh=PZPkxgLVIgWDKULzLbz5EJ0WQuzhJ45VhRLCp03T/6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmBcTCz8qZ+XKQqqQvoUmRaT3QAgczeAED7S4pYPv+rkKnYJjqD0HVniiLIcYXvDkqsiJwyL9mgJQptWaSTjae+q8bzZI2wgYVm3ILPog0lSeqCUzKoNNWJVNdFsbEbMFiFpFZwmCDYNvvs97+5Y5PpqaTvnHfNwjaW6uvyrrhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2oPZ/Fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLul7rXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICLVHF682839
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMLAnLOji9kv4nRsZe1IlIymkTyn1nxERx4sdod9gaE=; b=F2oPZ/FhxboVPYnJ
	AJxzVvbyyYbe3l5niKcNWMX3PbhXPKr5LR93SX2DFD9cwX2JvGFjTalxBsvSo/31
	JqM9sbYxChTNVByW5+k/u4EJfkEIAZJXxX+2awIX07zPJIRctECGVI+4vh8J2apg
	f899byuYdo97vX3+lxcJNbh43rLRW250tg5RBIDnNc3pRF2jytL9tnn/ZkYVl1B4
	V6hyOG8aEmnqcAESNt927tvwRw6pUfMDyioPr8BwrhbNFFi3PF/5L8YGvjiufP7Y
	zQJ8Ms7tlgqI3IKMTB+2YiL77PpjeAgy5Ad1N3RHZ5at0nAre5eI5w6o9XeXhfTn
	rhYwpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcnjhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:44:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb0b93e90so7546161cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779111862; x=1779716662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMLAnLOji9kv4nRsZe1IlIymkTyn1nxERx4sdod9gaE=;
        b=TLul7rXCrNURNdq15UMrA2vMuyBKtlhr+3JQ1TMFTmJup6OggPl0f9TSTB2VlGTm/i
         RWE03VOCEP5zMCYcZ1sD+GS8t5fG3yui7Q5DBsLR5o+LKCgRzg/v94R3LTGDW0dpT/Un
         6F2lQbg1HKTomswZ8BZcvqcGiVG/9qcGGHGbGY/lQFYe7evjymuST6UpAu1UHALpVsRo
         ZsajuvOYg5fz/1Tdf507zcebJ0yYbRrWOeFXBf3O6gU4nGL+rx822JCkS2Qi+7uYGAfq
         k/sFypOs8r3HB1gDVFmHY4fLcyEVuoAv1pUsIeydhZEr/8z7P/MMF4g9ZzNU+MoMV8f4
         Nccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111862; x=1779716662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMLAnLOji9kv4nRsZe1IlIymkTyn1nxERx4sdod9gaE=;
        b=X+BoNz611m+eBnvKBNL2BsLrWTkmtoJ+66yyUWcaHyDgkP25Rs/RQboFeM661vIUfD
         Soo7mBWS7aqa4mj/+HmkdbgSHs4adrMTjC43rtodF8AjsZQ+qIQ2hrTz4CE4nyV5euW3
         k3cqnx6D5HniX8amk3szDKQKgXx6K58OJ+NuVpqUCNQ5Klg0mT1ttStZuzGwEFgvdsPR
         oRpuNcboYilqJEBAxavFbADcdrRrZZkwwI2ZCjgD1A3aEcYMcXQO65nFl45qzg8n0H2t
         ToNLynK/tVQjX3vLJeuZzycyPjXiYjFE0uzV0XXEHcsCA9bGHLMJISc8CsTxcx8Wj/cr
         W5cA==
X-Forwarded-Encrypted: i=1; AFNElJ/kG3pilrfxMqf72i9abEXgt1fuQxhl/5sobKPF+yTwHXAfOQxyXOryo3DqabrsNj6bw4bSLoKL6ZIQ3vIz@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJf499XK8XtsM/TZjoNap1dvh4fbzG0FzNO++/E7LouNC0prr
	Ax2IGRdjXQ0Pk2507rmcUeHvCiC8dWE/4Vx25pNd74yPbziWQZh5pwWy4gY2d2htjh0CJGBnOF0
	62XqhfQq6exBNKIoupPXSK53ifqb60186hwzQ96cUZIgVjGiry9mmpR+guFtlfdxxXyEA
X-Gm-Gg: Acq92OHzNZaEqTkXQvtSNg7rVp0Rwp6VZa3ozrGvg0uRwlkkropXcS1lzQ8S2CxBrOA
	QJlBFObEWM2gaTf0VvvocHFtctqWRFCpwSJyP7BWCkIud8VkNJdT/wyJXA4bhPt5MLLZGOEcKv3
	PJ6qrZjsBYJeaiCsS1N/JUMJvDpejfdaHQ/saCl8VUVuXBFbZ6FD0ORnSJ1/NCBRDwyEXvGj2rg
	kO863hmdNIl7hpKzmBwyNgsoxVtrXeivLA8hmZdgN35K5uUVMxF6wDKsQyfzsoX3wzfdXXk6cLw
	XBq6Awzi2RHV+AwdxJO4M6P0fZdBQZYSWYJAwEAeSUPmRsg4N8uKw1N26eoVt3K6Hin03n3ACL3
	eV9At5pnqEGAGV6zO7CASmsSDkoIrl92Q1hLVCg4Pa7EAQLiHkrw/rMEHc4P7N3C67+x3dNuF9L
	qVcnk=
X-Received: by 2002:a05:622a:155:b0:50d:a92e:fead with SMTP id d75a77b69052e-5165a0c1de4mr138119291cf.3.1779111861647;
        Mon, 18 May 2026 06:44:21 -0700 (PDT)
X-Received: by 2002:a05:622a:155:b0:50d:a92e:fead with SMTP id d75a77b69052e-5165a0c1de4mr138118961cf.3.1779111861040;
        Mon, 18 May 2026 06:44:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c313f7sm574499666b.21.2026.05.18.06.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:44:20 -0700 (PDT)
Message-ID: <5dff16c8-5e30-40f5-98b9-c6b423013448@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:44:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com>
 <20260512-add-tracepoints-for-qcom-geni-spi-v2-1-3b184068ecf9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-add-tracepoints-for-qcom-geni-spi-v2-1-3b184068ecf9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0E5ygcLPOksD--G3yz5GrOW4BLBI2vm5
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0b17b6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rSx38Zwr_KSaChy-qZsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0E5ygcLPOksD--G3yz5GrOW4BLBI2vm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNCBTYWx0ZWRfX2pWH8VybH+Uz
 VPygYmO4UltiH3+SRSN5dPCTlazRegsAdOWSHvF5q1H8zDyMLO9PNfuPCNhhWJvh4e90g1loSLH
 C0CHbxZzrMVdXk+T5Y0667D+VrerAbMydtK+S/S0JAaOrb4018ONn2I6AHAtA3MN/jGKoLgD2Fk
 xuinwzTg7V+s8gbk+O+X7efd8H24VtY0rmSghiR1SMabDgWda7JQXIfENQxrWbktoVc1QwO+kBp
 mxtWE5E0fxdKEdsWsoVzTf05mhI8W7+ABFdoCEOt+jbedBzewyZoAYrMimX+yDSLYl/QVdobVcD
 jbzIfq01g7n1RcymloLi5gouioewissc8CSBatv7zWT82ELt7UTFE5133yDKh7zrzo1EOBZCBrQ
 9pI8aerESrpKGK+PTyEbsdaLqxLOhRESIKuyXFKdBe9mWK7Y+ewgVPWoKrFQud4hcID5kCPbbVw
 BWG6gyHYlP3FmlUhTrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108203-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1A72E56DFF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/12/26 8:12 AM, Praveen Talari wrote:
> Add tracepoint support to the Qualcomm GENI SPI driver to provide
> runtime visibility into driver behavior without requiring invasive debug
> patches.
> 
> The trace events cover clock and FIFO parameter configuration,
> transfer metadata, interrupt status to be making it easier to diagnose
> communication issues in the field..
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1->v2:
> - Removed TX/RX data tracepoints.
> - Updated commit text.
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

