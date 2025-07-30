Return-Path: <linux-arm-msm+bounces-67136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6329EB15FE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 926CB18C4FB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9CD245032;
	Wed, 30 Jul 2025 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCFSCEjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63742137923
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753876897; cv=none; b=Arg/aNgYNj2Tm1mp8DWWkNdJNMQJJ2BH/3gytaSkn5UnBGEwO4LSSfJ2k80vSTP7BdirwdM5nPlViJDxyJ8xiYxqSP8wIEyB7jyHwRkJpaqYJwHq/AoCyMC8GzDn6+y9UucmjYxumkcvaartMasOlxu12gZBIr1CEnrtvd91mHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753876897; c=relaxed/simple;
	bh=nENZrXVf0xEZ2aFw10idI8zS9pzQ3l3UevWHyh5TXeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ee1aZBBdiHF0NrQ5O7f7Jrcc9aryhCaYVdrEi+3yWkZaVMQJh2UKXESGi12yEB6RizdSCx45fuM5EMkdRiqb+iZxaqQCAshPkGZ5DKt22nn5MiEnAAew8hJsXqC1YeoXivnNTsb8+iiQnRzXBvAy53XC7nNchlxVh3XWpsaHz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCFSCEjR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UBqphJ007472
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7P4JA0l+stHfoiUVQyDl4hdUnBTOoJrHehJ6ZePN5w=; b=dCFSCEjR282VRba1
	vkgZOkQcVGAHlpXo9djo/qAV3Vt8gviCpLBq67kVd1XG4YBbsi0ugU8i0psfi98M
	ARdp1Pk5H0Dql9iPnBVv6SKsl1wNL65/OcFamj+KjkVRi5esJ8LtkwS2byolC7zo
	yvcKHpo2YduoRKOMZAJmzHuv1Oc46hy6QeSSaoPoSziKZY76xSbN2KajvmzLv5g8
	ba6ZG7a3ZukeX4YQEiL5qh5aAJ7vp1MlvtmT1DMTWR+1tX+1m+4+VeFGEjYgSdjy
	QjREGi42gSCKQq/FAFo2CL6VAosmOxCNdVifoW7d5m5gCd9huTh+Mj+ipOtIH/Rm
	Gvu4zQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwer0t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:01:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4ecd0d8920eso158482137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 05:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753876894; x=1754481694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7P4JA0l+stHfoiUVQyDl4hdUnBTOoJrHehJ6ZePN5w=;
        b=t8fERcYUbaHma3pvoWc3W5zmvfmh9hlDOQp20hEwQ4y6yXhWMKfzJ06vK3ioxIqp1g
         sKdZe17LmWo7puki57zl239i2HWHyle6afYXl0+Ji7qi3D89kz3GHYzkGJdPkHlRDX+m
         UaVmXifzET9L0sPJE6714WAGSQK+gXzx0NFink/DNiSLJR9HBBeGHW5PVfqUxb1xhaNV
         EhptaCrTHIfRyPZY8yY+1K19GKqBeiW3h6qwCc6ClnZS+RHz7B9GSyMH3g4Pnc+Ey5Bi
         xvXY7u64keL6o7OG/NxDbDqSVzT6Jntbo4B1NtWNJxvAZHiphKCkLpgfG5m5g3WUpYld
         vgbA==
X-Forwarded-Encrypted: i=1; AJvYcCV6rUMrgBagWTDHPSgAamJOs7KWLBc+fF3dwBgp9apiHGGUSKL9eggmbnCQA+Xd1Cew0RRb1lWWv0al8UtC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3dHcCKt5Sjv1P6tTSyi8xhsp3ambLlnFD7Uez/IpIUvG18o3M
	sdj7WNvWGSfByCZRqhwKR/pfsmW2ej3vFOKMeaFfbuGYLhLEFAteAORHJFI1WwwOXX2GAdv+r91
	wp60/Z6kd3EYlN/B+Q2Ady4pwPHYgZEFfQuhZSGM8UBrXEjb5pSxThuLQddbV0nYNWpCQ
X-Gm-Gg: ASbGnctYEU62ulE5OIpInVTKdG1MJphPvP4omUM7tXq2ruSZWnpxHsDgjISHPWP9KMN
	cHWqc5JFmAjhLcKjLF0XnQ6ssuRlQuoCgWOl+G+sGhwnN5RM7/gsulsVDCEOKIB3aQxCOg7VmvN
	rQfZ1tGncrq9fmTVUVx45Gt5OIwozUOOgomC6VYOZDKMN+MXSYaGvzJ8FLqXFI51N0hgXiR1q3v
	n/K3M2MO6rOYhODsTYry32SICO/BYk8d1Jhn26G3qXx69n1IkuKCL/p6Geqic++nbSqwyP7Y2TO
	w9TiZAiJObLe62TCbUW2eD9y7dXLgaIxDQf7ccuMe2CrIqeJYj05FwC9Flnr/GXKEDttVZB/eXY
	UHdyXWQRxCz5c80BQbg==
X-Received: by 2002:a05:6102:5615:b0:4ec:c4fa:c23a with SMTP id ada2fe7eead31-4fbe8743c77mr527584137.1.1753876894213;
        Wed, 30 Jul 2025 05:01:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvqburrLqOLTBhCJ6VDYkYHQwA8Vqi6itxndJTY3cfPYNQiShJQvXD/euk52g60pv2Ga9FOw==
X-Received: by 2002:a05:6102:5615:b0:4ec:c4fa:c23a with SMTP id ada2fe7eead31-4fbe8743c77mr527548137.1.1753876893774;
        Wed, 30 Jul 2025 05:01:33 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61544a81df7sm3572090a12.59.2025.07.30.05.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 05:01:32 -0700 (PDT)
Message-ID: <b99d2b54-b684-4efb-afc7-3a18635fcd5e@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:01:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add missing TCSR refclk to the eDP
 PHY
To: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250730-phy-qcom-edp-add-missing-refclk-v1-0-6f78afeadbcf@linaro.org>
 <20250730-phy-qcom-edp-add-missing-refclk-v1-3-6f78afeadbcf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730-phy-qcom-edp-add-missing-refclk-v1-3-6f78afeadbcf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S71LR6G7m4sa6i06Oa2SeXBPgGophlAr
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688a099f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=GIX-IF3Huo6piQy2-QAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: S71LR6G7m4sa6i06Oa2SeXBPgGophlAr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4NSBTYWx0ZWRfX4VzHnKWafAGO
 v7aZjDhwKCXMq+m0+M3FF1SdInX72Qjw0DtI61hlZzSY2tBs0kE/toOq3wYdyXfVpSFJHDA17pe
 Hnbvr499cfUleVDUK5HXaSjMy26Gu++g0bMM0vrV5hcArTux/OmORDm5Pn3B7G5QV9E0XIYj2Fs
 iGTd3MaV6tbpLUyPopRekYWvc3tGm23VmQ5ZoKRlSUNY1EY0wPMBf+KJpGNdzWnOFF5OWrZQJaq
 7B7FR0JBOgpCpGoVxxkziN5emf1fgOl/MzbuWy7NRAjPrc62qRb6HkP8qf/YI6iMu586QJuwCT+
 s2WZqZt6CvmTc/3NkrZ/2Givj+b60gFf+C7OmCwwJbaeMpOVC0HEKITb4WAlxRbkOWZhxgkoCxk
 GY8MYersCl1qiAIYwSIWhJjbE0HBP851E8RUMs8h+26P3T0R3I4CxpgVfPHxY1U5WX8wSs5/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=756 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300085

On 7/30/25 1:46 PM, Abel Vesa wrote:
> The eDP PHY on X1E80100 needs the refclk which is provided
> by the TCSR CC. So add it to the PHY.
> 
> Cc: stable@vger.kernel.org # v6.9
> Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

