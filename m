Return-Path: <linux-arm-msm+bounces-35944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A59B0CE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 20:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77CC4B25452
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 18:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5C920EA2E;
	Fri, 25 Oct 2024 18:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwPLDvLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3D20A5D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879998; cv=none; b=WCgmOunLXAcP17DhAzDUSSvsKpNu6+BUYwr30T6V5nyIMDqpC9BsX9w6cXLypUA3LKhkC1vkwR9iAuESldFxc+2WHafLFYvIbnq+WA21bxU9Ivb2JaMzVJbSy8ucoWTlGvDrDdEsBG853QMQ6KzX230pMpiJEUH7nAxIzKU1Q7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879998; c=relaxed/simple;
	bh=yECRnd2IuokgVBJ4FyUPRnU8Ngna585ZRd+94fsPnFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnlX+SKOwjkIRE6oqmLf26bjiClLCensvoLlUvWbGz2E4mwFirPRV92PFl9UbzI5cXWwq4cUdP9w7lLui/Zc53KYj8lZnSjnXK/P70WJqts1z9tdiDm23jIrEksoZA1ELats1SnVENTj7Nbls+3Cof/REbOqWOQHEOmmTrOETiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwPLDvLT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PC33iS030348
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6J/Qh2/LbR/I7UXVqELD64wgFXzyzqALoQ0edTkwr0=; b=SwPLDvLTVS/mgKUQ
	UeA5oIB9p3422rMg16g/82HFQNxc+9oAJhncxImi/WK/bFtnKOrdW5oUhjisbTZF
	SgTY7vH/7nC1udG5H8t5x9Fzmo4LQwGcqQ+UPaON3doWElfNS1OiCyHAaikbmtS5
	Q6bg8+7uhm9XggVIGZPxHhAWFd1Rs4woXGk7aRn4D4Fv+F/EZPptxSsRMuNL6+Ul
	MWqooxDK5dWQJVb0FD/kpkabGoxmiWNj8zY8CCMBXNu+1BTq3cSYT2WU6npZnu9p
	hjmjgNVqVTZaZk+yA99JLze5MoVs83sxgs1Z2ZjQhlr9A/kECVSJAYVrY3Va8ryb
	NIewoQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wa2fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 18:13:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbd0a3f253so4253096d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729879993; x=1730484793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6J/Qh2/LbR/I7UXVqELD64wgFXzyzqALoQ0edTkwr0=;
        b=ryskok4JPsPx5mbk7CcZ85XBPT8FGNq2Zt9W+YzVwOg2fbY342VQIp+mDL5C6mxpBC
         YHlu/Tyv7CS9Rm2n2XfEJi+OovDOvRzN/ToB/+BQ+nyiTAzu2e4Z7dBhsUTJQCfXQ7iO
         tH3u2CjELo1oOGjtdHDKWepoJ+Myz7UFSIzDfrhVP1C54DtKIMN6PijjnjRQSTxHH6/s
         cLUh/iiUhM6z5okaHUfxFRmD24xUOdCRa/UtKka+wl1Ah+PFbwZRZ3u+AswxyKtnLVlf
         KTU32Bkvm+XFJha+t7Y5F/vXgG460GwA7V5fmQELvr8QgcQd4UIpAntSN0/vX2QymL1k
         8SXw==
X-Forwarded-Encrypted: i=1; AJvYcCXFMuYaB++5SNvo1dPIECQ2dQaEFm4y7DyTjILnvF9JxyYz90IV4WI6eu3oCYL/3bXo4CrFUylDfvyZddIr@vger.kernel.org
X-Gm-Message-State: AOJu0YwcpXe40PlTroFhtKiFtAxeoxqwFavETCk9f0zbY7vo/8qcvGqm
	GN2hB2eUrLBD1BVdyjVpajX/mauJLXiY5BGugyKJmZ8Sj1GsF7LtXFW0pdtDjv8ljjTXL3IEwW+
	FSD6VGup1cHvah8jGg8nReBiRaDxilm9s9hOJX6DajWoaz0sj2kwm4Tm6Mlx0/ySe
X-Received: by 2002:a05:6214:da9:b0:6cb:e981:d7d0 with SMTP id 6a1803df08f44-6d18581d7d4mr2307956d6.7.1729879993242;
        Fri, 25 Oct 2024 11:13:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFetU8WERXTxmTfnz8BSCC6cA2/u+vTk5Tzq/OIHDVK0c/Vs/rj3bS2lkScfXLw1sM4zfAQAw==
X-Received: by 2002:a05:6214:da9:b0:6cb:e981:d7d0 with SMTP id 6a1803df08f44-6d18581d7d4mr2307666d6.7.1729879992907;
        Fri, 25 Oct 2024 11:13:12 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f0298dcsm95063866b.77.2024.10.25.11.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 11:13:12 -0700 (PDT)
Message-ID: <a4c85bfc-9e76-4dcd-ab09-699d50fc73a4@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 20:13:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/8] mtd: rawnand: qcom: use FIELD_PREP and GENMASK
To: Md Sadre Alam <quic_mdalam@quicinc.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241021115620.1616617-1-quic_mdalam@quicinc.com>
 <20241021115620.1616617-6-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241021115620.1616617-6-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MjYApw7MIMiQnD6J3JM74djgd7piaZAt
X-Proofpoint-GUID: MjYApw7MIMiQnD6J3JM74djgd7piaZAt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=809
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250139

On 21.10.2024 1:56 PM, Md Sadre Alam wrote:
> Use the bitfield macro FIELD_PREP, and GENMASK to
> do the shift and mask in one go. This makes the code
> more readable.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

[...]

> +	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
> +		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, bad_block_byte) |
> +		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 0) |
> +		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
> +		     FIELD_PREP(WIDE_FLASH, wide_bus) |
> +		     FIELD_PREP(ENABLE_BCH_ECC, host->bch_enabled);

CS_ACTIVE_BSY is no longer set (not a functional change, but it looks
omitted on accident)

The rest looks good, thank you!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

