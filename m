Return-Path: <linux-arm-msm+bounces-77049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 133E7BD57EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 19:29:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07DFF4E1299
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 17:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F908305065;
	Mon, 13 Oct 2025 17:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJyMEN6t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2850A25C810
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376526; cv=none; b=lBlGdaBiewu7+sVYcqswRsDiIPy1FLAsJ+JBuGZbKKj5X4BN1P54IZIkAf6TuOmQ+i6jq1h/F0F884RnYxnhBcfa0HdRNov0tdZEFmO4bSvim37Gy0x50Z663+dOSxCt8xVNOTRy1/gFwPKjoN6zat5ZXRA5ZQ9NL84IFYDneBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376526; c=relaxed/simple;
	bh=75WMmQOON/mN8UZfCeUS/OCA4lFZa1WW4EmMGmT2FXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyo6ohTgeKjNblMDt5yxHU3BztlY7rmeXHm57/mmrY7L4m5xgwLReX0AyjrVchBKCRo+oM0gC1ydeGo4H31HUTv4gAbT/14zeA8ebfWw3OsmdNSiaU/3i+qg+p/M/I1cViSY0qN1ExvPk7+A1lqcGhssCuuxoSoGudfdiUfx56c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJyMEN6t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD906005654
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 17:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7UV7Izd9gdjy03mbMGcctiqtINEtc3rR0Cr9fYXcQQ=; b=jJyMEN6tlJ5JyqpH
	qHo3Z/zgux+tPHLClKQPFuVvcnathoVisY+TxO2BcnBBSruHCs8BKw3EwYMbQcLK
	dpF1Y17oKcXpD9Vl7C920eu7mD508p+9UnHgKkqRJKw2Lr1ayXyGVW9GVO9qNu84
	4vsHEPLWsAooL9nNy36FTHn7WI0GXi3c6gH1N0rkXL5pBmktYHSFWUXv41dcSeXx
	k/IR2YxSiYYVeIMsFML50t1iv7NCCyri9P/if9WDPehi/URjUf8gNyQJtMq2Od/0
	b+dd++iMcomWNx7bZ1jKbW5nAoPFupnPyrlKvOZPmYdEtyHVoV03dJnl9olchG/G
	X6j4oQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa85hwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 17:28:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55443b4110so6290388a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760376520; x=1760981320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7UV7Izd9gdjy03mbMGcctiqtINEtc3rR0Cr9fYXcQQ=;
        b=OwDidzzPsIYH69IsnMzDATNcR7SbaSfKeQH+Op3sQjYjEFpxxYNfPmS424DiszRB82
         m0uvosRhLGCjblkAxBAOQqee7mdv6MpgCOso1CLrYUKeh8RNumMcj8z9z4CcQzSx+zrR
         Nm5OZJw+Xiwxdj0rIPX/jOkSrTWzzcB7VOxUxxCmRcfa83HYxh1HHOPGy3qEHfvzhV4w
         Qh5gp59OrU8EVu2cbnwtW13u6w0S4qHq8Tr23riEWwryOtuCuV2m6RB+bakn3pjT2ses
         Arzj4R1QS/XXKmNLdS8CaUgEMFsfwI2BCAziwKCc1sENZRyaOUbdXaFz2XBHJ7NCXx9Q
         sT1A==
X-Forwarded-Encrypted: i=1; AJvYcCXFamTR2w0mRXB23S6HtE/0sk3dvOgQ5UmLHb6JWMB0lAIBxKs0AjybSd+z++0TqfoNYHSWFabvLu6i/+yJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5STtMO9IPdaDj7st42tYomTIN+3+guIMShnVeK5dmYEtbWhfp
	jrBzfZUZPjGXrYhbctk0dNfDM6c0yYp4tNMUgIZeX/7xSLQDJ+t4pcrMylIS2yyfF81lmzXbSCk
	cAZMyD3fTKcg6NP/ZEFDclwdX7INaX0cyXcXtNwJmoweCyVNtYMMagFQbomvuKPOOjZGq
X-Gm-Gg: ASbGncuix0/Vbty+sCkNkELA3mPa5pQW5Es/jYuP6okGN0oPdOckkaaZ7U027r/FeLf
	6eed6pem1SBvs8pB1BDe9WvovGoHi/2JQsw4NuJFD20Ti0FmmnbE2sC7oXFAEbcfiNEIXN4sZ/9
	Mr14LywgJeDkEdMrx3GQypOYgfmfjEeCoHKjoQj0yonYRl5NZMWrEMC/715b9vc9YpQikdRVb5M
	JvrIj3GE/1ooX68evoOCBclEraT6gB+Nuxok41r629Ikx+K+v/Q9slgX0AeaV14Mv6ahmBUx0an
	hzg6qeVcItOhOtbLYLKOMmPtl3xN3TfqzN8X2ScCx2RE0D7xiRFb8zUV5cRDNwwAe97i+dp9VYI
	yiWddkMXaB1vwCQ==
X-Received: by 2002:a17:902:f641:b0:269:8ace:cd63 with SMTP id d9443c01a7336-29027f43af0mr273065135ad.30.1760376520187;
        Mon, 13 Oct 2025 10:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQnGs37X51iAdKD905FEiBr68lZ0ZmtwBGMTgR+akXMI0OHEezC7vorYmKbjrEJEau1vmRFA==
X-Received: by 2002:a17:902:f641:b0:269:8ace:cd63 with SMTP id d9443c01a7336-29027f43af0mr273064935ad.30.1760376519765;
        Mon, 13 Oct 2025 10:28:39 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f9cf7csm139233615ad.125.2025.10.13.10.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 10:28:39 -0700 (PDT)
Message-ID: <cf63523f-dfc1-4aa4-b5ac-9f2fa258d9f9@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 11:28:37 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add support to export dmabuf fd
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com
References: <20251007053853.193608-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007053853.193608-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MGYzw4_ZD7DVGSQ--XDTe7ABxFSJURfv
X-Proofpoint-ORIG-GUID: MGYzw4_ZD7DVGSQ--XDTe7ABxFSJURfv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX2v27lj11wFYC
 UWheimCj70W80ePHT/wBiWyfthMLgqfim3S7wSFhwXg5lYTOGz/npUtH/fozNw2mOYH+4kyZZFd
 f2Qd9AuzEb3C/uypASwm+Pvsh4J+qEeTHP75MAiq4amBKPYJP2zOfwwvkCz75yQNFelLbZ+siS0
 kBcqpWNUTJzfqpi1u0lrQAxF8Mgo4ENN8qYV8zR3WMqQ29ysBa0JD2gFg4vD07y7GHheDaWjlQE
 EPNttDhntN/u/St4idevf+yr4qDevJC531WpDu8qALYJlfD7c4OuaRRMJ/YVdFq+gzlS2jJbuRJ
 Ki4KV56exgH3lII4foJA7JkaF+xmhoR6kRGP207GlynVR8H/K1AMrKKyO2cPONrn1qggzd1boGU
 pJtee/ZIIlXKWgZbNyXfbN/pCxzApw==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ed36c9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qTQW5CXGkwUWSGTXi8sA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 10/6/2025 11:38 PM, Youssef Samir wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Add support to export BO as DMABUF to enable userspace to reuse buffers
> and reduce number of copy.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Applied to drm-misc-next.

-Jeff

