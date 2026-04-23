Return-Path: <linux-arm-msm+bounces-104226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCtxGRbd6WmNlwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:49:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7F044EC49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 583A0303D561
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1BB33DEFEF;
	Thu, 23 Apr 2026 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYGq6six";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VKAJQX96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8EA3B8BD7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934153; cv=none; b=TzpuDUpcgjK+jZdPJWrtdm9sdAwx/md9sZ6SN/nFPASdac2t4bPJJjrB960vH/htg6Dstl/gBXJCMJmzll417Pad+6qyK+TxgapPomqncv9nHVXcXokJNi0hR1CeUNLScGzHMnLBs2fBJL0VwF7yi/NGWLxsLjC9t1yJQqVjaOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934153; c=relaxed/simple;
	bh=I2U3XsezvXd9uh4PW749z23HA4VB0PSXUJFwIxMazsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJzeeb7ovkXIXXEVm0p7oXHHijHqhiElK29ONOb+fx8lhSW+8eLwruplYNXvTjXkL4CNhCXhseBcWX5CfNQn1ICDmBsR3juFeoDpjysJTWtKi6BWk4IQ5060QMecDNPNVT7bZx+CRA6B3vL2LZQBkQv5+2N+fcKTnfZ3BamjnQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYGq6six; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VKAJQX96; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3DGak2956037
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCzsJFXw3FhVBh4XGBhd3IVV8YIdrDkuxwic5Z5yMJ4=; b=CYGq6sixIIDNpjuZ
	p3P1Rikw6/qpimmfdqrrpVa6s9s3XvC2dGq/UP3YzSP+luAIT2RqTzTdeE68/Mu8
	JSOCy/4JWPJNhFfTP6ruqCWrnW+mGcMAF2/y7CELMPgkPbG8BbcTLWX7Y0mo4pgv
	DH/opIiTzsqcjkbmc9xlOmm24ASqtTUNIRYQnatei1sta+rPr+VuvLgFZvn5R0ja
	K/BPaEVGpzBQLHgxF5wpRZyOZ2HgaovVEoXcMV+6W6sW0Aae4FDwszdT6O1U2gWQ
	BPlXjmVPIguQyYEMhQHKWPddLvfIZGFTSj6ViZ3N1djltatGrDNp2vUwoiuRFpEH
	vdTxnQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q330t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 08:49:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d45ebdbc9fso123681185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776934150; x=1777538950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCzsJFXw3FhVBh4XGBhd3IVV8YIdrDkuxwic5Z5yMJ4=;
        b=VKAJQX96EkvX3Ks+ndazcVp5dlPar0cb83SJK4kx8F6oThMPwrXHXqTntlv51CRj7P
         Ib8P0HOTv7yrdnAxEUqFGD+aBPkjnXVOR2hx1Wj+IuqFQjN33WG/YN0HtKJATY23PtJo
         U/j0oJ39FINNYbbZF8TBSndVRt8b4sSNmZVaKowXvGtYItI8bAgk/WVylxIRs5uIyymm
         +I7P6hnTOhTFMwSL48a7xJLhlxa+Sgku1CfSfgPBSuTIqndEuV04nKIvoCC/RCUHu/af
         b583854TGrSqXO7q+iw/OFoxw39iEaBgQEfECza11wzRaeu+iumu+bpJajEt//qs4M+R
         Wk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776934150; x=1777538950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCzsJFXw3FhVBh4XGBhd3IVV8YIdrDkuxwic5Z5yMJ4=;
        b=pC/KsTZunWnwGzQorhrM7ScDvCLixxxi5zOaNyyaPw5riW7Ayp1ERkrwOGU6rDbJw6
         QVq/ZkTUCeduRR+5i/5Cg1wq+NQVtrYI9DHYAEmUyyJMBtWAPiHTWKRzn55AC/L8kayU
         2rjbJ+65svi2cA6WEKvMeUVWsL1vU4ApzcV+RWFpWh+SR6lLzNy1ANCWEraVeNO0p4Ss
         8CALqhH5Jcb1uFg6QtSVqze10VCIj+6ECgqIDenMdyuTL3tSuvfgcDc9WLnIMSZm7/Kh
         KawEmfkgeAUMlpbI3Suxlgnem0DqHTveL1UQkGuZQyU0ModJOlA8uTg4yH+Pprz4sapm
         vaLA==
X-Gm-Message-State: AOJu0YyXeje8QLf2arF/WgLig/smJpy//1+MEYisyhgjFkVKssPIZo0n
	oFagvUmG9xeTPVlsqIyNIzp/r7LlwNRKZVI2iGaB4Q2Z1uEx4rJ5KMHuCkkd1Z6siz2Y976qQd+
	Cd3kr2izwgtb6JW8piU7/hfmH9RVWiT1lOpYaxcyW/cyWbTGrx0bDvYA7bqKMJ3GFp6P+
X-Gm-Gg: AeBDies71HRwP3gblBrCpoKV+XOTzl4/6L7cTHIce2cV2+fBz+RHYkoIuBqjtQV88Ww
	gmSR/uakZefg+xugnRxIuyAAH/Qa2t23tnj0tEM/ZBMBs1IKfD7dJSkMvxutVd+4GsfI0t24/w/
	4hVVk/6Y7rnRb2zAVEej093NhnHxcYwud5nxxdZdii57cfAqymRQPcv1BRJOg2xABYccamOSYx0
	nXB9whdKd0B7lWxKgkvM0cxjMmBEf6zkiF/NE44ueBqXJJLH6RSFkCgzmE7Wgqhve1tZbYhwEY6
	bXKLtWCeuXtDvYVp8KsKrrV65pPfjYxXGyK2wc8arFzVvdEcPEk5GFxaGOwOQ3HXRZS1D1eLIjA
	bcLyG47fErGdT8JpTrx0pfm35IyEYCHDSqjzy2tAQ6yOvvCg0s/aynDPPDdTHlREM9Wpb4ESM4+
	K2TqxsZ+as8tKN+Q==
X-Received: by 2002:a05:620a:29c3:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8e7916ad048mr2263462185a.4.1776934149998;
        Thu, 23 Apr 2026 01:49:09 -0700 (PDT)
X-Received: by 2002:a05:620a:29c3:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8e7916ad048mr2263460285a.4.1776934149558;
        Thu, 23 Apr 2026 01:49:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4026054a12.3.2026.04.23.01.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 01:49:07 -0700 (PDT)
Message-ID: <caa2c3b1-1ea0-424b-84ac-d50261a06cb2@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 10:49:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] pinctrl: qcom: eliza: Fix QDSS trace
 clock/control pingroup names
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
 <20260423-misc-eliza-pinctrl-v1-2-2498b365ff2c@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-misc-eliza-pinctrl-v1-2-2498b365ff2c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9dd06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UWz2gvasjxx2GRne_YkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: J19fIT6cZQWAs0tmQThJGJrDqILpeYXt
X-Proofpoint-ORIG-GUID: J19fIT6cZQWAs0tmQThJGJrDqILpeYXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4NCBTYWx0ZWRfX5A2Bzf8nHoCq
 Ovg6SjjQEITLurYiX3JB93Sb49RwvA0mIpTJeRhsTES+pz9tpEMDagYBDMEaBwXO/xgSXYjLcgF
 qVM4krPj7TXtOxcjS+bWxFGG8xJjRZJT1gTi+02JNE5VAmwNdH65q4xiIWRYgOKv8vZv/3DRhTu
 5gI01nd91muZSsL3qhOFIJFnZHo3Hu6pC1qBswBJQtooH3Gd9+/u7ZqZ4W1gfDZdj0CUV8yRmPB
 XC9aknYWwpm7RVA0vGCItnhChHJPyYG41dv1/wBnR/EOCNcur0fBD2iCv5D85Ol0UCayYZz8AAk
 gcCM0vxEaqwMatWQAHwsU+BazyZVMzULtueDPDjL+4zTsL1/AECtdqNt+zStZaubQ9u2FGKn+pr
 qo8HrGcRHWbByGhr9otkYTjW1ahFIOqWbuJkjltwHubXLk/vKPbQlGVccKLDMot13h+Cg5S9WBg
 Q5Jgyi3jL0rtaWzXsMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-104226-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC7F044EC49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 6:51 AM, Alexander Koskovich wrote:
> Fix a few typos for these in their respective pingroups, the groups
> already exist they just weren't referenced.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

