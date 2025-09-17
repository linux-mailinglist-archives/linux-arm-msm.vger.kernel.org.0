Return-Path: <linux-arm-msm+bounces-73942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2FCB7FB0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F38DD188AC3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573C03195E5;
	Wed, 17 Sep 2025 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qu1omjiP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3282316192
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758117511; cv=none; b=oGSTxbHUpFdnCCphXCeT8DeqGoIGyNhBzL1JJWaVWQC3QSdKUoLTmj7X2maE/LT+SRVShcPSAmw3rxmohbayR7HVRHQ63khsF6aB8sfFeGyIfqWllucT6M9yaP/BsMap/4bdO3x3n7kOl6B2UnwHqzbAYTVNBz34sDsyu3VQC/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758117511; c=relaxed/simple;
	bh=Bap29ptjcsZrGpm6RgpSfT7sjPHuC/ajbiIsZlpP9qA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKfcSiuqSl5gJKIua7lB5fFEg7GOoZWS5sbwW9gh69tzlFhsgRzgee5PC1bSwCjnGw9bvc2yO3f2xxzuB75xeOHa540ArTiIPzVn7mZ0F6MzPHo0V7uKNbK/wF5UgaCoGkCcU2zKhV5l4qa/3IKaYfqcjg1qMCHQh2tNjkL/zFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qu1omjiP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XZIW032421
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bap29ptjcsZrGpm6RgpSfT7sjPHuC/ajbiIsZlpP9qA=; b=Qu1omjiPBZMPK5BM
	2mIaADHfORtt8Ze1D5YDpMg1rFc1sxF2l7DUQQKzXNtyNtH6MokS9k7Xw9nrjIqt
	tWQ1sDJF/pX3kPA+DyqmS4yzz5PGKhoZqW5blyvHTJRrZQWqio+YoaKaj/vX2LOl
	ZvG8HpBF4aGVOd1z8LQlHkfnvGFmVkQ5EeblCw9i+EV9MQA2sNSU1fWJUqhM1K+z
	YQCk706dKfrI1lunxDa9YmV1AXIMKT7+tlhmbO4H+NkZKy1hxzwIR9kaAQ6loEiY
	CqAnbJsyQ4l6RhTVTppRwNI/X9UvppfqG75yiDG2APjg3AcB88suAMes3p7ZUufI
	MzBt7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyjkdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:58:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b77da4b375so15787801cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117508; x=1758722308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bap29ptjcsZrGpm6RgpSfT7sjPHuC/ajbiIsZlpP9qA=;
        b=sELV7yYiANyb8v+7bpQrGltOpV5eV7CaZDgiZqXGhFGr/LsnkH3+KlYTC4kyGdza5k
         Cj0W6bMYmwUBiL0rP76iQPK8iMJBNU9R5ztzsliHtM/Evr+Tsp9Itx4xH5t30QTYvrCV
         PEfkrnUx8JA/KHYO8HytUkU7CdTHpO6Y7AthKkw05cf9SJJFTeww7I5COYsjK4kHN0h7
         SI4UBNvDWlzs6G1Y6ysgudYzerltEwO16VpJ/VcNTsJISSaYGyIdSMQksOwgyAXiNqGG
         DXHBLkT7xJXLrgGZSTHGLbVzTWCFjgwlReIbEClrA0FbXCbtza2SwuZzEobZScqDOkLu
         nJmQ==
X-Gm-Message-State: AOJu0YxVOss46yvPrA91CgmIuKH9mrjBDF2g8ddZ1i0lYklFlUQIBzy9
	m9m6ZotRAW/7S1BbnRvRg85KY2fcEhYKQ0F4yMnu93TimkmWQaYp3waScjVIPMMn0J4eSHGxDzk
	d/3pTzdkW+Fn9z5WTzYhDHe9QIFkkt0chhEQSbfNkoZ328XiBntFoCPcRP6vQSMP4+6MT
X-Gm-Gg: ASbGncsgF6LoCft1D/d95WfE1fX73/Em8Y4nZwd+5lz7doDz+Q8SZJxH2xuQXgu+40L
	vFSi93Vd549zhUt6WJDcQRDec4FHMG8bwM1UAwTWGgfGLPvwn8eoBEEcTiK1lCLvuWQrVFV7Ii6
	mT4D2jJDH+97kjwHUUjAH9WNOKsObncp70dt0E52DfwJcuCd7XqbPXcDEkW2G6qQsi1Futz+bdg
	UVT6kOSrvc3k2ewCb5H4Dg47IbtmnW/OiNa7xoO9fe9dt5eGvRw4KAaJjaCdp97pJKxcd6icNPM
	WBvIfMT1M3vAWZpONVof9SK7lcWDRzaf8As+DpxexN5LOoku/sVJa1PJztn4N8Cdi2fPCEEhtsg
	Mp43YKPyoXJ8mu5hLNPnM9w==
X-Received: by 2002:ac8:57d2:0:b0:4b4:9d38:b93e with SMTP id d75a77b69052e-4ba67f63fcbmr15850331cf.4.1758117507656;
        Wed, 17 Sep 2025 06:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzl8qZRgKO760HE5SG604Jpiu8qKnn+9Xk5rimSB3ai8LQP+dMPXzzzD0y5Mr3IYRJFxpE3g==
X-Received: by 2002:ac8:57d2:0:b0:4b4:9d38:b93e with SMTP id d75a77b69052e-4ba67f63fcbmr15850081cf.4.1758117506982;
        Wed, 17 Sep 2025 06:58:26 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f9a7d8793sm308788a12.38.2025.09.17.06.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:58:26 -0700 (PDT)
Message-ID: <56d34704-aed2-4c61-b5ba-3cf3c91b2806@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:58:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] arm64: dts: qcom: sdm845-judyln-common: Remove
 framebuffer reserved-mem
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-12-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-12-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cabe85 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=lLqmTuED0iPNNbIZDJgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: PgnW4Eu-pdSVaSA_jpDAVPAejl2lRdGf
X-Proofpoint-ORIG-GUID: PgnW4Eu-pdSVaSA_jpDAVPAejl2lRdGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXy/3wnQ5pBFZG
 oKBFgi5AZy/PBeHbfl5Qg8DxrmQARvFQnUUFBo3VD8oT2Ls7e5MSwfDjqNN8JxX4KXF1vY4Yyv+
 t2Ci3iY0YAkpeFxiiFuvIpMBfbWoecKke/kyVSYhgv5K9rRCQKYuo5j1tfD+BIV+K7L9FSHfLB2
 +LFAhIYF96/xKLLxYX7/ZMCBKa4FDmoJWgT5RN0LnGf5fINeA8PeXtnJ6tKnYRBY2m6eppWgSuY
 LHEADNJ2Y46tphdTaHb0GwFS8VLZzwYdaYQdzliEZSffjfB0oUMjDGZNW3q6SNkEcu3hNJlWO13
 nzLiqvcqBoxMgbkLWrl+8+yKF/CWyvEBsG5mD5KMMhDdS/eU/BeV672vTByezAiv1bywjdZIRcD
 CujlxhQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> It causes a conflict with simple-framebuffer

Huh?

simple-framebuffer even takes a memory-region reference nowadays

Konrad

