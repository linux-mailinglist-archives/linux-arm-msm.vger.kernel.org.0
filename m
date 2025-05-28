Return-Path: <linux-arm-msm+bounces-59679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E8AC67FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 13:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E77E3BD6F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6472459D8;
	Wed, 28 May 2025 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3umwhj/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECB510E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430197; cv=none; b=jm+8tp55FtvNPW3w0lAMXG5lvZteI4/iqwzHbSaR8gg0EQFPmjVHATkMMqnlxkoTO1ktNxkO+IL0hIs/0+xTcGhaFQLV6xzqlL6BPeTLERfaIptMK58FxUcBbSgoE/o7icPmg0HhxZqCIAOI+/U3NXJ+OqrwcyyO7JNFmDK8JvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430197; c=relaxed/simple;
	bh=/RJIvErotRj3to0d6kOm5wmObFlOfph76zWlBJ4Q9Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttGN43QcUucmFM9URQXtnWtSTect81joGlu2QEmoaiX8mXIkoRaQsjRJfkCrYqc8kaodLbAj236swC0XJEoveP8lzUp5Z1/zcDS56wM+ZEYRUPJ0jufOkMJ38E599B/O9P/sq5zzuK0/V7T0FhQ8i+KnKWz335qU30BNngnspK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3umwhj/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8gG9T022962
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ELgwTpMyunvmM7oXC9JYUZ5V
	y2pFyIIsfyTDjxB9GAY=; b=p3umwhj/5BExpQj33huf2Oh+q3NmW1Ns5ZP8BmwF
	cPOg7fHjAtrFgcPC+UAIlxGuN007wmXrmOpbd/IN6OPq+GA+t7B/hveMWLYmyKkF
	DAYwI9iG6APAwESFbdskCqOSu48HEIwfld/+JdIrQBK3QXqQE8gJi0q31DXR3RVO
	GtSrEGfoQA51ic/+QL+/xMbvVuEuRGW3ohflgv6JmO4An4cgKO99ql0aNd0LnmD+
	C7MoQN5TkP304S0idmf+4INg+3jaAxW06ftV1dvgLyDmzt4ki6GvXY3sEKZaFWPy
	Gt1q9YUO4XCyJxJbPE3/seQq/KvvUmsbxu3b7568WzGWDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcxea8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:03:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b94827so682134485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 04:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430193; x=1749034993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELgwTpMyunvmM7oXC9JYUZ5Vy2pFyIIsfyTDjxB9GAY=;
        b=b00Jhol8B/0sjZpNS4cj7dz80i/yvbGnCDW9vFEjzgA/Sm5dDYWvLuqzGBufkl7E6e
         4um1C+KtptynzyWINU5Evch3I6jksuzavXTX3C6truILl2E8lWpKibBb9JUGFNN4HstW
         VDBMBOoDQVjnspTNmQaliFINxpy5fOdi+9LOFUxGPkf9CD1o21HNg3HeTwLRI4ldcnst
         PNg+V/Lgyobjb0OFzLRf8cnfzl56R4uAe6Il5b56j1MNzfUtuy3UOxmxcF7Q/HrRBK/t
         0oPzEO8/nNxbpLgLmfGBeNIwe6LF8IHX2QeKkPHj6okrKW0o7cu38ky9MQTA5gKLPXdn
         ofcw==
X-Forwarded-Encrypted: i=1; AJvYcCW2a9J8KvjlRYl7upqehH5pD7OhXckC2jc9YYj7W5edfRVizcz6TT5jcFSOVntbTyFTqIcSjmV2xhZ+yHr1@vger.kernel.org
X-Gm-Message-State: AOJu0YymodoRTpaGaMv8QgXZYHfgqai2jeTooc6AuQpxV8Prhbhu8c+r
	pCZe2k9UTQzZDkFA3cehhKZP1dFpwzmfdUZ3/isHIEu6bN3jCozSvaWsQqCVEb8wf9DM0ZqWxBE
	3cBcDkQ09OzHeTrbqYFVeJ4dO6ObwAdiNFN2SIwln8RmSRcn2TIW1ImtUlTDK7Wtd5E8/
X-Gm-Gg: ASbGncu7c7LkjEtAwDrIyxmyt/VCZtuYPl8K1Bwd4u9BjvyqzGjJkjjruql5JxdhVxO
	No2SnGYI1mxeL7x71W8E4AmM18m9nmVTL9w9e3UuVAGWgWjPceOMYPYX3ewCXvjSr84Si0lQ99t
	pa2U/du6VssIZHu7rctKd7NDhdpZVjb8YY5VoeRTqkgqafyllNfzinw1Qpr0kU0TKn+U8RG2o0m
	RWNrIfbkej2mF/UwENi+1iE2IiM73hukLBT7lDTabHyKRVYNqYQfJXwGJub3Oqlo8S63o9tP31X
	WFHtYVGI186gw7Ytz8JINAT2VzgbPmW9JLCFoBYl/LwQMZN+4ow65ysPH4CttXWyt/bOQ23SErw
	=
X-Received: by 2002:a05:620a:372b:b0:7c5:5585:6c8b with SMTP id af79cd13be357-7cfd19dbd92mr228984185a.50.1748430193406;
        Wed, 28 May 2025 04:03:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGnv4Xt58Punjx8otwKBoHUwlys2VKyZhjUmL0mq9X43VaGyy/glqWWnkmJnsvnpqUXlWpEA==
X-Received: by 2002:a05:620a:372b:b0:7c5:5585:6c8b with SMTP id af79cd13be357-7cfd19dbd92mr228978885a.50.1748430192892;
        Wed, 28 May 2025 04:03:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79f69878sm1973641fa.89.2025.05.28.04.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:03:11 -0700 (PDT)
Date: Wed, 28 May 2025 14:03:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
Message-ID: <d4sb62vm3nfeqaipl4cw7wwbrg3b4xzqhtjkr26ephfmygnnub@aaqoyzfnw5y6>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
 <20250528-ddr_stats_-v4-1-b4b7dae072dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-ddr_stats_-v4-1-b4b7dae072dc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tbEk2OLjgtYxV4BjGChVS3NRu5VIJ89N
X-Proofpoint-GUID: tbEk2OLjgtYxV4BjGChVS3NRu5VIJ89N
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6836ed72 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ahjRXFyu6kw89l6o8aEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NiBTYWx0ZWRfXzE/diY0x4uia
 YNKnZJ+dtcnhgAICZY++OLiYPYVj6qc0Mms8CU4BPXdPDgAZARWhE4T1Ca1syvuSp6etg/8n44F
 cuhwGGZTunX2PCwrFMGeUX4sy1uFhYtXuYhW7nyPKvJTJHC4vgTtgoWh+D5A5lKJ6UZ53hZ6+yy
 DBYuoCXEpe+hFw8BaWe0mofJ0SpfsECxafERrjHlNghzMl0abSx41gw1C9/u4y5HzZrcqicS7Zl
 TSs3FLfv/tpkBLFqqWv7C9ZhUVOvk3ldYYIIMKZMzGbOSSFxKz6PBCpzpvYNKWl3Q/QV9gYscMW
 Xm5EHvqEUCZ44bRcD0SDmG/Ds/XY08qVuwkeOaWVEqKyAGXSQsMo2xxZJXBjATCGPtAiMtxNFUS
 NLNKLwKAqpMzhMXgtlKbrDCsdswjXRiaEmFful7Lppdi3RWotiwfxxSTCMfWrAgD7v3/h6mt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=830 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280096

On Wed, May 28, 2025 at 02:51:31PM +0530, Maulik Shah wrote:
> DDR statistic provide different DDR LPM and DDR frequency statistic.
> Add support to read from MSGRAM and display via debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 99 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

