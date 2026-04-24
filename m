Return-Path: <linux-arm-msm+bounces-104447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGxnOIxV62mmLQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:35:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006C45DC88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 13:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC9423012C42
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640D23BADB3;
	Fri, 24 Apr 2026 11:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK+gM500";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HY0Qjreq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1844C3AD510
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030491; cv=none; b=kMfFzRjrKdAsYj6Sk4LhnyHGH0wU0V3jNtTv47gl1FTqwuzXwm52oUuRjohzqSHY0616zqZ6vJ/JWo2CFmFiDYwGMw2rvdQXmerM5/rAUiCYgiaeOi8HKM4VkIIFyjirZ5DdRoqMcxZAxdKTqo2Sh09WtII1TrrLfKcH89K8cRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030491; c=relaxed/simple;
	bh=cuCKH6YcmagYwOZiieg6yMey10pmTjCyRaw2ZACHAMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvuUTBllPZZPcgvmyNXhUMsFPwgUHLQsiPCi0nUrTduB6XRTl7cMZcOosWUR6ibzfKu4GBDk+Xgb+jhbhmpKmUmXxLliS+nxAlSaEqeQNtcFbwbVP5fzXGptgLSjfKJ8MwkV6Ce7m8TjeHw/pivF3yZezHqZ/autkB0SOXf+A+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aK+gM500; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HY0Qjreq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9HtDj1532385
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XBKKALhIGEeAOKEFlIPER1AMTIsq25/lJaVNg9OX6sg=; b=aK+gM500uC1nE7rD
	C8U8z5JWrWxP8zn5wrVfn3GxeNsJRmsNDpnDhwUiaOn56+xQ489aRlq8h4Lnv4hD
	cvpr5Wq8Ix/HFcqzvLqW0C43uxhz9hnGKDWL4FIW/dpO9beTaf4+CYac4PRfgVNV
	nZdV5lOtmBLLmHgHW9w37Ui+ReGC9in0nCHshPbakWMjSMaDZD7MzDQZAw5uFFZr
	lSjlu1rvQgsJr9nMlIO6Bm3vNwZhulKH5i67V4ipLGy1MiWFd/0m+TjjFLYNizrW
	zvfr6U18W3euZXVHcxhwlyGkF5CNRzYFPVD3OkenFo+cl+7EaQhyDe7rSHwybAm4
	MfTE8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26kv8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 11:34:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9f1bccd7so15100701cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030486; x=1777635286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBKKALhIGEeAOKEFlIPER1AMTIsq25/lJaVNg9OX6sg=;
        b=HY0Qjreq3YRGcGwGndkBPS4hB5Olgfw/qBMhL4sH2+oHovI5eEJlhPCS/P0yrBNL/M
         qKV+OjrJ4kkiX+dQ5jycG2mEaVA0S+0Tk28ILO+AMKbr9linKbq1iZ1aId05E2P2YVAX
         tGbyMZyPH5cu5ri55fnemilF7AXbaJSb/pQeiu2ac9EZMrZcXUOyyexneXSu0Fj9GYbO
         KfY9pPkJS84RMvaerkK5REX7bomuofYrp6UwuHcfp1xNS00PhRba9+JyA+AQ82EpMq8r
         HSmfustQH3DaeNN3A1kmj/Z2+nY2XO3c6TGtYfZO/rvTZcowwPnURIllrgnVzdkv1Wus
         dNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030486; x=1777635286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBKKALhIGEeAOKEFlIPER1AMTIsq25/lJaVNg9OX6sg=;
        b=OSFFWkvrkJyBdBkutdrmxFXMYAu74b3J5tmjDc1zJ3XFcC/+wD0zei4Td2GTcQAEed
         YGYSaYIOkOaWEDEVxRKWGlyq+qoUbTRhHTZobyG7PBE0AqO9/Ft7Wo7hsM4OFiTwLd5G
         Ubv2hIsRARYpdAFiB7lq/+2cTN2oCA68c1kE9qguKoREMdGOrJaSpGRglAsBfCK9W+VV
         Zl9AJdq1uszFOh+TcTxbdicKM4E57iOuohKci/Fa7vkyE4TzcnpjGrZqxgO6NbgegkLQ
         WXwuvuprSgREZFd1dXHjIByT9NyDoXIRfowWDNHgyC+KgDMAfO6fEg6Y2MpVHcUr9Zbl
         yYMg==
X-Forwarded-Encrypted: i=1; AFNElJ9oVto0BCe6+c2mcyVCXqAc+icv/B8S2jFY1zs9qVVvw8C9wVulv7vE5Er0B+rjZ+EysckSP24d5M6pkhKV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42jOITSoWVWK79ZatVd88j6QZXaC0zY7Ia4FqnYhiHOAWuP8X
	nxYhn73pVx3ptiYy0iJ6TIiljjj31r79Y9bGC7c9fJho2QDbIYh/Nb7MnEpZIQxmTqNyVB8ZYpu
	QSo9sfbCYQmE5goLoDKk1+75dKQMfyyr8RmQJ3fm8EJYDdoMSXqkxnNlah7VTKZd7lWH4
X-Gm-Gg: AeBDietdticAtl3XQyUZ2bCTf5BO7y7S6ekNgndQ7fFOJPMXr7uQg9cXZ2ZeJ/P6wod
	CceMWBSzdNorHR9YAW5l8YOx1BL0KvPtgYJOmeeBjgRNv2mIxm3xaM35YtWCSRAXv1Zk5D6wio+
	OLIBKhHVq6xGnM7ZHn1hinYOiCQlM1BrnC74x101ouXsLHwKIl+GuKMNB7RIFPEiWf87+IBXxJy
	Ze8Mj+UQP9Yunlqru7YxC6jrAyVVKsd/rIqUkaJpXaeCS8C9j8G5kff+m4y3UAAq2T/9r2yvZ1b
	A5FLVHwVc4ygZwtqlUbuQX8K7i2zwT7y8Z5VVtiqJsMLMLENiKV/83mF/h2Zoy0ZPx3TzgxznmE
	QIjlLjkPes3r0eJKjetM2xCR0yRQB4+LxzgoeBH1lk0ykmc9um8tapKT9WWGb+58EAf7FULzYIs
	82mbzSgq+SO5kiBg==
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr223600921cf.8.1777030486057;
        Fri, 24 Apr 2026 04:34:46 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr223600651cf.8.1777030485653;
        Fri, 24 Apr 2026 04:34:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5d8f9sm4701356a12.25.2026.04.24.04.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:34:44 -0700 (PDT)
Message-ID: <c93df63b-6544-47d2-92a5-d6f2995e736c@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:34:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: camcc-glymur: Add camera clock controller
 driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
 <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zEwpaqeXFlzMTpAx5-Hni_WEZC3mZRy-
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb5556 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=i2Go3QXZGRdFdhsXBMQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: zEwpaqeXFlzMTpAx5-Hni_WEZC3mZRy-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX8Ug6lRSXatBi
 B87YL+B8nI8hvGXSUgD6iX6vkrb3J2fOBlc4CBkqvv7wO47lNN2BofEpAyLHw80wYPee1uQ4PCY
 js+LYdUTLg4XzGRSEpZShFaH3a/1NMyyTY3bAjijvdB/d8fjCksSsyvnPjyKjp0C0Tygu5g9WO6
 O/HCgSWzmePI5MyA/6nuc/iieCSADYXp31mZPxGeQTUeuOakIC6VDCCRTRycVfUahhWWwICpIFa
 D2OWL9J7QJb18JdvUT44u7coStK70JJSs8IT5f0/kXOWx/d+GlK+Vg6p6vOWS/L2mOf8fGbFUcc
 rqbeLvlVnK2wNKaOGtzUBiJMfSxrln1AYSdE9+M5XKRGGsgTDS6r+kLrP7ZBqEf0KRy5m3lzDVq
 7IG9Ji5hXqVqLfSO8+EbaBZz3KJ0QkqqYC+1ewmeGWK+D4aKEY260MgNc/Z4x83lkjQ3dL+jHwo
 CEpRFxnPj7jT3AUBgeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240110
X-Rspamd-Queue-Id: 9006C45DC88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104447-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/2/26 8:15 AM, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

