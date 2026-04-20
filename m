Return-Path: <linux-arm-msm+bounces-103726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBxMHCv35WnjpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:51:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E14D4290FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11665300440C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2355D388E63;
	Mon, 20 Apr 2026 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyCV0cQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvZNrNhl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D4A2F531B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678693; cv=none; b=KySG5DQP8JB6I28n0VueaStQ50iQN+DZVRLEBM7bfaoeseIBQ+Mq10Ysg/mELYCs4GHufwxvS0j6AMUbVVtzzMrFeJ6VNSqFnmDK1vso5YUr5p6aEvswNJf0F6la0z/jq1KS5u8ZfvW438N1hrGvAXPgF/+RUt9AOQSSrXipc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678693; c=relaxed/simple;
	bh=M3JrCCNYq/LsQQXow9xyNwFjb3Bny+ZEYI9GFCKwa4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTQf3mOwgftgV2jIxp+50xA4p58itfNXujtXU5YqgH1T6M+2fN6eA8ZPdmvGV+xGT3Q+PLYszv8MO+TvAop5/AxUj5EsDj1MYs35jJ19wlaHDZLuQ/wY98HFO1FenQmFWs6k8Daeoe0jkRw1s4cslHasvzC/yVXgw1kUsKTdjYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyCV0cQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvZNrNhl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9J4fv785498
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2oCc4X5gfbIoFNXE8Bk9ftZY5NhIpmxBruq4adzXl6o=; b=TyCV0cQ0p7JR9Jdm
	lRMzYXbDDJRO8q51VJtAauzJd32hveMutEZSNQBJtXkYljOVEsJy9RwVV3t8S7+0
	awB9nXONzDtSc6PlfRFj/6VP+DbtsCwJKyh5a1+2vuN/xe1kCpH5cuO2gI786nuV
	+8DqG2AXJxRSKch7f4fKIZBTYZvsj6asRKzAy6ngQkZo/Y5MKfIDZ+HQWfVXoQCA
	HXXlO/IP/RPQsV66fZs5RSLvbbNhLFZkr/IXIUZoWoRV6ipOLTSvItTRKhyBxVIp
	/fDAgTroik9LQ/szwnVsmpyHpKa3kP/rdjkVlLrIb3YW5W9IzJ3T3yGc9P9UCWmz
	+hK3fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhg45f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:51:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e429ba4dfso4017521cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 02:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776678690; x=1777283490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oCc4X5gfbIoFNXE8Bk9ftZY5NhIpmxBruq4adzXl6o=;
        b=OvZNrNhlcTQuQaAylnU5He2AR7qa/dEMGWOe3xpm2TjBbXh/UpJtmN3cqV+0fglIbi
         OPxOvNh2o6I85IExRngrejdzAXXKyON++LjkXk/UduV9Hq/1bOUNvxU8OmcFWdGkv6zz
         GFc0bwKfUgCV/XQz6DokYW+LS6PBGaKtZtaJv8DtMiU2OrRjlrekHFPY1jvilj+GH2AW
         dPl3vgU+lyuQtCPNFHoHS4kpRePqJ5XoNLDRx4bVzPf1r6WtdSUEab+EE7CCMdbLt366
         IWPk605/brIH3XMRgzOgSkxf4+oNTpNRddUP45fXbCZC+t9immqhU4ise14Pv9wmWBVs
         Q5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678690; x=1777283490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oCc4X5gfbIoFNXE8Bk9ftZY5NhIpmxBruq4adzXl6o=;
        b=gICR8baBxjYWRCc/QMUfzaWPs8/L+fMtI1ry6Soe55vMjlR2mjfFsCImTzSEdhFWnF
         VZFHW9vzBJKWNvwTeOjWcCIMFHlk0cD2zjY3bjB06bfUjB9baTQr+jmp0hGXUq413LiQ
         GQyijHcB7xCTJsIWfzcRkxGO58fVNGVknX2PvhGT6tpTMsbCZZak3A0smYMxxUKevlm8
         670aizLJc8lPiWPYEpm8uHVNqP0ZtRjgFrIIPg13/OjtT9inCij31OdtPIIvQSYc1Lw9
         sFFFwEKNgoBcGd4CyjJMeVg3L4GCNkS1bB/XuaHtveBxY4dEdgFiqjCgyGQ64kJfDDS9
         vAbA==
X-Gm-Message-State: AOJu0YzOt79wYQ5wrU37uHGm5VB8SKPVwgXa6Ku+OjFGO7LiUQS6QWj6
	sKWFtJ5Hd9lkgWPVTnY56pl9STZ6y6cHS4CoX1e3FsuK0UQeRU/aXZMt5oaSeQVFmnryd651ILt
	ny2rZK17vS5BEljke3nL/hbJBwiyhchZRouFn6MrsFypPTtppL9faGAZ5Cr4+i42pHjpc
X-Gm-Gg: AeBDieu8cPQ5ytb0bIVLdAgTxmQqEqxl8CkdtpNIExFRoe+UDUj7p/jptr4xbMx3LoK
	IM4nlYX3ODyLnNsymohlhTVT3lWdBoRmpsFBYVBr6yKTQb+S3CQfK2w+k6flQKJf8kajjVX1Vj3
	lG4yAwciNYw1LTQsy2o91ot0Suq0Ddus5XMVQFrnRtQUi6nGgkwzKLqGbo4O35a9DL6e0a5f7Of
	Ab1bXYCeLUxKnrjndS7dql37bQLIa8+S0uSqsf3iuBoRBuv3K9G35pnDnoWeH2GMxpuYBI0dgp+
	iB5kCsKaGw2iiOc8HbQATqWH7vVQ4i0b4znwfYW4s2nMcIwbZWb4Ii+64nMjf1POHtQeCy4aVYE
	m6uIGbcjtQrTW7zsiNF26hlwlJF+2hHzAD+FlJMjhMvhBXFJwfpyCM/j40kct9tK5fJ4PTViyY2
	6lEIeqvtVRnCYr+Q==
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr118259501cf.2.1776678690275;
        Mon, 20 Apr 2026 02:51:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr118259211cf.2.1776678689761;
        Mon, 20 Apr 2026 02:51:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451211091sm348953866b.5.2026.04.20.02.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:51:28 -0700 (PDT)
Message-ID: <5b4b68df-593c-41b4-a0af-4a59b10faee0@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:51:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hpCjbs_e6eFPl_mtx0mLTED_YNH6PIam
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e5f723 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SDBIUcquJ5ihQ-it0pQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: hpCjbs_e6eFPl_mtx0mLTED_YNH6PIam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NSBTYWx0ZWRfX4qXzj1A1/V9w
 D5Sgb9ZdOloEO1wYZwNVbioPDE3dgG2THsYAaCBtHOrkS+9trnBr+vXI/kexzsEjt4vGKgHPF/6
 pxTEMyoWyXSCDerMzUBeyqmBPtmuloCPPl0TvojYLW6PO1R9AoANWO8aAN7ofLJCScU5Aat7Qjg
 wcJt61qMkQBOJyY8pXMwxpEnVuR/zDv7S0XgvuFNa2ioA0/7iKM99vQFKUZzgLyXpa4dI3mj7bA
 lmwmimkXZBemibp6lYlTBwDIqNS7d5W6ubT4GpICSwgZKyjYb1SWVhuSQE2DrglkCp5NHbAwxrU
 nvumDVDAsZD9YcwxkZYVhJ27CsCDsSYYjnU2RVVQw0gk3Rrc9LESjoBrkepHkKsAtPrw7sCC8dj
 XYBXcOJPKP41QxIZJoAbJM3MnnRef7FIotCkL7x1YM5O+/W1HZua5FaOQfqfSTjq08RUUzbZrkZ
 +VmtlgXxEvbH5cf306w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103726-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E14D4290FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 8:12 AM, Viken Dadhaniya wrote:
> The runtime PM functions had incomplete error handling that could leave the
> system in an inconsistent state. If any operation failed midway through
> suspend or resume, some resources would be left in the wrong state while
> others were already changed, leading to potential clock/power imbalances.
> 
> Reorder the suspend/resume sequences to avoid brownout risk by ensuring the
> performance state is set appropriately before clocks are enabled and clocks
> are disabled before dropping the performance state.
> 
> Fix by adding proper error checking for all operations and using goto-based
> cleanup to ensure all successfully acquired resources are properly released
> on any error.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

