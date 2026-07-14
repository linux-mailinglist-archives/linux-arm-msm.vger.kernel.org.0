Return-Path: <linux-arm-msm+bounces-118966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TIN0N3zfVWqPugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:04:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D82B1751B93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 09:04:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VQfrsCzI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=chg76cYL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118966-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118966-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12D413008089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B2D3806B8;
	Tue, 14 Jul 2026 07:04:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECA0364049
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:04:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012662; cv=none; b=TER6MzZ4MLpDwCaD4bzjFa4RrpbYyHgSRpPFoy9OXA8hcYB5VxJ1xNAD0SuOBqzaCtXrC91l252D0oQ/UrLRTyr+BJI7TI/PdeQuuBG6GGbzHSiKpDVtn18RajiKMRwixzMjHLW5KKx9uJ7qdUZ2QVVtq0OQ9302iLgQfxMH2Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012662; c=relaxed/simple;
	bh=AwSHCjZnPNH28NCllLARawhdoELgkT6oB5VwMBtEsoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0Rj/zxgSKg7GBUBr4TXReuf3CEaT5wPL7uw7N+S7tquLtB3EYH+3IMdVoYeWuIskcH4YL7d67o3hAR5KWI4bmQ4+G7aAHTYhSqo78hz7KN47q2Pd2ocKwpDukA3f35kB7uUxEvCooEuRX0hamajN3XtXxLQwNNObWoUYw4rGl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQfrsCzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chg76cYL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6STLe3743651
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33OQNJjnR4vVB/ZUfz5W9v5v4LaPR0+G7DvFFOtEWZ0=; b=VQfrsCzI4gmaRiHK
	YB1XGvqDAMOQvWWwIUfvR2x7XIe/Kttd7sqxYp5eO8N8FRXUY6I+6xASfcS4Lgno
	3n3FLgfQRtlHJzGMBBnjUV+h8FNRzg50LvEzlftLQz9WCkyB4lM4HzZkAZm8ewvs
	f7c5Qo1wgJsvqAutzqyZz2y8Yq3vDyuLutCsMkuVaVbsqZ2HcfMXEQYeAfa1FqAE
	Ksi/gXzCR18Zfb635xQN3Cy/yey0jOQ8FtqD/rHQU4nn6YQefMavTBuqZpAj6a9M
	nlFIzCSxJmCykCjotVCLky0GQT3OWCBLD4sd9cLTljQFrx0AUCVmH10+j7jfK+yx
	RftxSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2ert-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:04:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9058a836724so7459966d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 00:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784012659; x=1784617459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33OQNJjnR4vVB/ZUfz5W9v5v4LaPR0+G7DvFFOtEWZ0=;
        b=chg76cYLeoXGB3ql52Hn8fXbzgleR8gQ60OIbiXdUcE+8Xa0uWG7t2dH/xwxSejOen
         dBgsmBlnddxQQUC+i2r9lB9OYBS4nLVIRE0Ccjq8nOtQKbxBF0e+0O48psSsnUMl4J8M
         vXnAWiCv3Bq6EZoQd5ykHUxfVAXHSTCYFi2vxa2NmrmEq/XEQSNky/pJqr72Ju/dfltH
         LCfBYMN5KNelZMsb2zJfmRRluh0uGn3Kqe6NhGBpwa4RkFilN3w1SbDRnPgLGFx3RS+N
         1EaCoxATHud0+Cl4Q2CmvLSJFoRwME/znmA9YUhFfRhCFlAnDu1texeiAf1a0M4mnfeB
         CgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012659; x=1784617459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33OQNJjnR4vVB/ZUfz5W9v5v4LaPR0+G7DvFFOtEWZ0=;
        b=kpamd6CrfyhdFpHqiv/OXT+3X8pdli+BT6dxox8DtdOkuAZnmItqcHybbqiRHa05ix
         jCstMbOPdqH5QKuwwanp6gO9fi5+Q3TqAzM3OATJyhmkp3921nu1f5fnnkXTYZe1Env0
         YNJAdEXZbW9ZEhkMG8Kv61F/gOz/sJ6Shy33jAPYTON9W2oWV/gluZLPKYFT9Q4ws8f5
         oEVnAXSq/bu9bTwvzlMuxJovinYqoBh+gQkWa9/ptAiN8aPZ36iXwoSTrjprA74hvrxM
         c+gieeYSAZxD2fsB/YZkVe8By7MEQcjuN4YecuXdFhS4U15pR8XGPxZutxq/vZQQiYSG
         jUiA==
X-Gm-Message-State: AOJu0Yzx6XsQdmaUwz3T66KXg/6oPWdYFuezEft1hL0+2hC4nkMHQwns
	V25kUcP3LV6k8P4uthRyBt4MjNy/vFKOoxUgy6gU7Wa78VevK0WyqxP7ANy66BHPIHSZ3pFm7f0
	h+KVa7IMuYU1Sm6+2p9z+Vgq+NAh5vT05aMyu9uR6/5ZD4pp1ikl1u/KY9O0ycyfHylwi
X-Gm-Gg: AfdE7cl9oBOjmlEh6ybIOVAYoDt9G2BHqy6cauGFskhsM1JA6hxc0BnMVWFzsiFuuPd
	nhADV+0+b7SOlaL9jCbx/PNHgEjlN4UinYF69kICHA8w3RCF/G7JZ/7qDmFQJOk/2k75gRbPcev
	1qOf6/drCOMsrUTzJyxenkzvb0/Yo/SEaz/mMfRQbVmX09niviTXTnfmbFCew2nVQBxbpqKYEHj
	fTUgHg13qzkax9Yq6euV7YPnv7NMuHNGnMN4mAjDcJsDJzCdfl5FPtIuh2hveut1hxVF99hjHyH
	cpFBKpUPEVRfY0ppNRwyb3bd7SPbprcAeO9HkN2qjYnTy7s+zR937yCRCgzA3ssXPmSZIhJmtcJ
	pYb+h5v88VQQPjMOr0zuTuweGA82ckJ98q3s=
X-Received: by 2002:a05:6214:1bc7:b0:8eb:1061:552c with SMTP id 6a1803df08f44-90402468080mr109015006d6.5.1784012659694;
        Tue, 14 Jul 2026 00:04:19 -0700 (PDT)
X-Received: by 2002:a05:6214:1bc7:b0:8eb:1061:552c with SMTP id 6a1803df08f44-90402468080mr109014846d6.5.1784012659270;
        Tue, 14 Jul 2026 00:04:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd293aa31sm882074a12.21.2026.07.14.00.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:04:17 -0700 (PDT)
Message-ID: <aed4b20d-084f-4e49-a019-55cf684a8394@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:04:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_wcss: remove unneeded semicolon
To: Chen Ni <nichen@iscas.ac.cn>, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714032253.2768008-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714032253.2768008-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3MiBTYWx0ZWRfX+ouhlCp+nJDA
 iVr98I73EZPr/i09NnlMvKQhaC5I/mJAqUEJxZZeFnKW4u4ScuQkFmtCNr/NdePRFBN3H/Ci8lV
 rEUl7qMsWm4KT5KMzbQGGjbxl16jD+c=
X-Proofpoint-GUID: 31jFmWkUnTlgsGEkPssV8m5LF2zEjEoH
X-Proofpoint-ORIG-GUID: 31jFmWkUnTlgsGEkPssV8m5LF2zEjEoH
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55df74 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BFaq2IH8av6HCuzV_xgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3MiBTYWx0ZWRfXyWkklJ9prgLK
 7Ul1qfa8wSCIuFfKrIeyArJFvSaacJ246ZPaYhuxn/7mO2t9Wi+y+6NdvjXfJS+JzyjpZMbH9ij
 VIFeG8EtN8SqECGszi0+e+5fOHj4EX3jPyd9wJMPrm2CCcKMLSLjl+vGVxotynL4D3yaUvWsSSe
 FZ2lOD1jngxnhGjMJgb7ZLlGAdJDq1LE2VS732AP1eIs+7/fwKp1Tvh91hCkoM7X962ih8JfumT
 m8MqLUk2/Wda7LfdN+ECcoWv5V7ic8OoLOVByGX27mB6O74XXW+2vD1Y94OjBf2jJqgDGP/myOs
 8YSjOGmkvYOexFKviPNBnFUZTuXvriBLjfP+KEZzyhln912jvwADU+TqKKU+y2MMsrYkg2GmkwQ
 O+tN7KnLDQZh+ThroX4FAywnljN86knSzBjrzwUC6hhtkpZFk48P/56fSHOtH2iNQtaqrmJOSkY
 xPfG4AYNiZ0KATNsRgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118966-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D82B1751B93

On 7/14/26 5:22 AM, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

