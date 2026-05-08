Return-Path: <linux-arm-msm+bounces-106656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJpxNwzF/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:12:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339B4F5844
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56A123016EEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AAC35F179;
	Fri,  8 May 2026 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+ecELfT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UG6Cy96X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D77634D382
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238645; cv=none; b=LTFn+AEzU/0TyNXVUlKyh+qbRcOTB8ddzNhvvo0nsk6ota64fCPXr7dxNETV06uafe7nJM7jSGPuXCKaMg7IHEL3+gb0AKP9U6ypY10cn9dTuHStiCHqJynP8cwmcf4vCjLgNvUuQOOEruRt3EOid8y9DCUcP59eYvep9tJVies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238645; c=relaxed/simple;
	bh=eDeswBy3kVQ1hC4y2p4RYl4HS+G9UG3EGp3csnqRyko=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TTiWsv+SI7hVjJnSUeR9LzcDK670OvcGlrgzWpVEKuWO3cbfUjskk9iLKmG65hhK56BD5lprHcqzNp7vJMvFvTCJbd4tReLkXj+cf6Cs6aD+h7CYmQR3GqADRkCWSMpphgKOmMJtWOXqx8R51xDczCwoK3wJd8I6LINKBR4LPl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+ecELfT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UG6Cy96X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485nIOp2778936
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45GkX2zQJ5wcTLHOqlJdrhMLCKR0ClrSuRBtygDbg48=; b=j+ecELfT5+YRfp1b
	HkmITfvsoGcZhF2apBjIvgzcZCafwDa9l+rIrxBCBmDUKDrKY3I+YzVi2r7x81ra
	aRicmlfIimFCokiNmfQGd4Ba8AWKI2bftKkXvM8TFx0oxXK8pd2fW7scNxvBK0lK
	lXgJuQtEj07PSvvKrV9hMCPlJXnAHe0v1+s9+EhE/DzsOxLR2YffaiqngoSsgfKO
	kfyosSJJNzQXFPb7wzVgUDyywRAkPqhbacf2F5/9SVhwwua7uVpbGocaibQVpe+W
	8sQn5lKU7kC731Hb3SItXgUm4VfbwTXsUCjn+TKb/LDe+tiF7DjPwo0+HimzsEOd
	VnyU/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1285jsgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:10:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5c781193so2890341cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778238642; x=1778843442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=45GkX2zQJ5wcTLHOqlJdrhMLCKR0ClrSuRBtygDbg48=;
        b=UG6Cy96X6QJEQYovCyNnLxXDid8/XbAoyTS05C6rGJa0z5ipFuXFqa8lCWSLqUJODI
         zD/rhROjvIHvAXHWPECyMCR6VA0ke9hPh7fN7pzkUMH+9wrek8DrVHnorAL/EY9RqKvx
         HR7p56ASIi+s+x2qBbx4+3b01mxoOUCx0z50DvB4jaWX4IOTlDvjD9+zk/CNYqQz8QUh
         yL6vfQV5Rgmyi/fLIUnuf1VEYC8fb0Tubk0PbKO7e2pA28n3l0RWyvaBQouqPXLtG/RM
         pBj7ZPqR4ct/roxG8256+6mIKvJFfWBlmNh3D3QOocnB/M4cxQph0pmvFmDl1BBwmnHs
         KRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778238642; x=1778843442;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45GkX2zQJ5wcTLHOqlJdrhMLCKR0ClrSuRBtygDbg48=;
        b=CmGNau29vyly4hd+3G3QWvCzCWsr3xTj3pIY86bHrWpFlgBKl6wFLNjpBmtyyPB4dG
         oFVu+3TGjGoONkvw5TtwCqxp2UG6V2Bf5aCFYRI+xBrqdETJZVlpTVa13kWtp9hf7/jS
         37TBrtQqYz+LUpAQ7UY/jf8HwDlp88D1Msyf2JDw3EUM7d+YXPpaWwVKEIrr4zrnLep1
         bZNS7B4VF2nDFbmyji7QxyFCID6Ox3qvr8aIwPOEsZvUOrQYsmXkUg7HXn4sO1s2fFkY
         VHFF1mVX8RvsQP0Nb8RI51CFRiISZg2foTIwREO/gxW3xLBJ73OavQU2GPfx4mYQAEe/
         AaZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Mfdo/pQ3cfyNwx52KL8Va7XABY/DwtoYfaXiLJaL0YxATMAnFVIraF+Z6Q4Eml3/yfnqeCuoLqLA2O0kq@vger.kernel.org
X-Gm-Message-State: AOJu0YxHRMHuQeyn/sewmxU38h+EnwM44kjOUqK4JSGp+ev/flM5TQiZ
	QqX3c8nPldrjXe/7dWTZBN4v9iBFlENt09+p0SYrlzk8cZt0SYJng3QyKkzKd/syMdiM/iTNDjn
	/OB5GKXvW+DjBWIS3YdoSwlXZzVxKPdgQXP78/2lEkHYUmXSKjWIRbOEVhSNt3Ds2qLIf
X-Gm-Gg: AeBDiesfDQHbBPvDCF3bPLTb+oB0srAzQVb4VBuW3Yk6bbdJX1IkGpF8vTQGM7/Rxg3
	68MIFZybAWVOXrdobXR30HGI+dLw/hX1s9VjW/6y6S3WGkxacKSMMEyD/vMsUo4uFihLpNdvlDt
	X/LlCW1mTFikyyRzuZ4JvXdkgn8NzFg/mQUwD0YqOc5sBgNAtp/lUnXM2nmm4rtXlRLErU6Hnv3
	B8xpBdCXbapzWz9PGdnn4Iq3T8yvkFaEjx2PQrMDI7L/wioLdXZ/gECpe64AM2XWLStHXfwR7Mj
	AjtfolB/mEX1paRg344eEABsYebB9WcL7WYO5c2382Nc2gjiVc14INNBrfgLqCDcQUn6SCESZ66
	EYgc894JoemAouqt8UStrUIkCt8Ud2/iaoV1kjrIDz+DwIhiYSnAA0dsHaf4Hj+Z5ZqDq4To2Iz
	N6QeE=
X-Received: by 2002:a05:622a:1e92:b0:509:d76:fe73 with SMTP id d75a77b69052e-5146288fc59mr116475551cf.3.1778238642598;
        Fri, 08 May 2026 04:10:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1e92:b0:509:d76:fe73 with SMTP id d75a77b69052e-5146288fc59mr116475291cf.3.1778238642129;
        Fri, 08 May 2026 04:10:42 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a534sm567288a12.9.2026.05.08.04.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 04:10:40 -0700 (PDT)
Message-ID: <2d3a515e-d8d4-4cc1-985e-89d4fe31e618@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:10:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] clk: qcom: dispcc-glymur: Fix (possibly) dumping
 regmap
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505153717.303414-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505153717.303414-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExNiBTYWx0ZWRfX6hRCqo17NTyV
 IJcbP7m4iXQ/GDWOblWiLJ7aj89CnbB3DlqHY7j6SM8wyaOsbhuLlZQh5gfsvgQJQCRLugca3mN
 XfwoRcYNm46GdZrs3+qX/GNByJkIoasyKTw72o0xpR806RmWI45aWyKuKjXsRFVFeGIbsk0/i0f
 /OalwcpDBzVFuy/LDXxB8tof7vIh5Y4IZIdUXzEiKIUxhUDmFcI6kixZhUoNl1iH2V/Riegonym
 cwP/B03E0WX9TMoMvwtVBnCrl9PME4xT1ggaI5pQy9Z5Gh6OK9LGDe+295FG3so7XEaIO//8L4k
 4xxtroJXJl2AoOjyZgkRjPXaObGBoV8n03oYgwuM7n8LMBQHJ6Nrq8BDhoOqgqaGX9PPKqOYy+p
 5StXgW34WULIVGD6RTVROxHHscRvDI0iADl41tsECwqgmqw9TfnDNja1/iD2ZWfIFewRS4Ta2EJ
 skiRV/2UUJL05KmJq7A==
X-Proofpoint-GUID: GgbigF9j0If4Bp-7_ToPCkFNQtneQqm3
X-Proofpoint-ORIG-GUID: GgbigF9j0If4Bp-7_ToPCkFNQtneQqm3
X-Authority-Analysis: v=2.4 cv=NKblPU6g c=1 sm=1 tr=0 ts=69fdc4b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GZO67VJtuFZV25e5ZKUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080116
X-Rspamd-Queue-Id: 4339B4F5844
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106656-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/5/26 5:37 PM, Krzysztof Kozlowski wrote:
> Reading few registers at the end of the block (e.g. 0x10000) might
> result in synchronous external abort, so limit the regmap to the last
> readable register which allows dumping the regs for debugging.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Register map is the same as for x1e80100 and sm8750, so I am guessing
> same problem.
> ---

This is not necessary on Glymur, possibly in relation to lack of Gunyah

Konrad

