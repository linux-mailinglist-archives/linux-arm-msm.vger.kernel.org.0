Return-Path: <linux-arm-msm+bounces-84527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32575CA988C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 23:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1E93313AE72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 22:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E7A296BDE;
	Fri,  5 Dec 2025 22:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VcP8K4hz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eViwMG95"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB22F12B5
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 22:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764974805; cv=none; b=TcNqqG/PgAvg0l6LCBJYLbe0NHZxKJ6t90IT9ET1jZJ86HhGU/utBM+kdOT+ZpdLrvn8m3c3Y75Gl8tpg/nIin1ERogX7fHaFHan7xi61YNlZrx+4p+mGHc1Mngsm7jufagV3QasOojf6Wwn8kI59T1h+tvRqBTv4hbCpi/QwH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764974805; c=relaxed/simple;
	bh=s54DUBlniIfTQG5fm8lfKTLEUg7RzP8W4O4OTB+4wvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO3eRAuBO54x+0YHLpISvV60KWdc+RAnDIa+mHg6VkBf+2YKeWgVjBABgLIQOt6qHBKxUGjR9W3hSbazGKFoNQFnOiGISBKjzhI9pX93GT0QnJB4kTeN2ShK1G1uEI7Hkn+juJrCPDGsB7uu5S/RpWqpfPui1DEmNWhpMbtmAb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VcP8K4hz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eViwMG95; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBGFE1075457
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 22:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rexPS3uTR6hPe7Lt/DLK2HIm
	WtH+Q7ntibhQQMWSHMg=; b=VcP8K4hzl5ZaBLvBo2eV+vf1GM+ELNhyvzfjAwKx
	TpT2BAAM6B8La/8+/DVVm6OHWQbT5u4o314PnHMpk/xxd0Z5hqyxJgEl3pSGO32d
	r4pC5Vb9tY+41oILEjwUhzvc3njvz08XocBRv9ihPqXFP7qgAQ6shL1IOvLimMkC
	8OWZ2Fqi2uIG1MIhyaSp8GensJYF8a6+Q2KXKqH7bLRGLwrfWNGpgZA8pCBJZDBG
	RShF8tJdBNGQS9r0pdggy8EtUWW6WeLHTY5nlHd9Pzv1h/QjHxQ4NR+4s1d3DbUu
	SHZxjTHX6+hBbzPxgDedwjHd06NNRD6n8lf1CO1PjJSYMQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ngsd2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 22:46:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2d2c91215so595325585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 14:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764974801; x=1765579601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rexPS3uTR6hPe7Lt/DLK2HImWtH+Q7ntibhQQMWSHMg=;
        b=eViwMG952HAso90u+ue3fHA2LodYAfdzlz4qpGPk7FgjEWtqy3Njxz4sD/RIYLi/uZ
         ajRSDClAieiIg151gO2FybTEQKf89tBqa+frzA4KzDTAHooGT0rHlewNQEy/FZ07x6YQ
         AkfTLypf5i3dmHW59dXWi43nPNTNOAXwA2lLiKxLr1+OH7TQ0swzCj5iJDjoqBGJ8lCE
         yiZJA8Agq3rAFRgVyqhLooT83r6jfXEtiBsBlqhcy7dMTn8SwAJw4RzHwv1LlnrRYOi7
         aWm1Fcyhur5MgPhus2IfpE02ML+CAnG9HxeQvoKkaJoLILKH3umIb1zI6MAjZKKLzmBW
         e/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764974801; x=1765579601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rexPS3uTR6hPe7Lt/DLK2HImWtH+Q7ntibhQQMWSHMg=;
        b=dAWcCQVnZSzqfs/FITRcJC/efuxKzgdPt3o0vAgPfI8dVmWheK+nJmLKeeM+doeYF6
         aT4iWAlJ6itpjkNsm8B+OsWblDWnkqby8yS77S3sZ6+dLuWJGprJg3BD/g9xeoCy8ykL
         YXuXCh73Sq/MwaE5YqCRrfq+kJ0c4xfzdSDpE9FhW969KyavuQMHso+0hHrOx16ILa5N
         lG5w61QuZoIK8t4ZUJDkzqB7FH9cVEvXzZpCUoNGFzhZxefWI5gsrcY72EYfH73FkshB
         E/wt+lLUJ7TeIUpkvkrNYjtY076lxch+ly72fFLK9HnPLlhWquXa0/MvK/ZHjvnRcQYp
         X5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCVxqMEE50cafVA7UHw0DvUn2OMaBgNZU4A6vThWlISgyCeWeNljTUgCnV8a0oiyLmAHo4JnJUSSon/SEcHB@vger.kernel.org
X-Gm-Message-State: AOJu0YzC2Fn+EUDItRAqPmcTvqM5XYBNLCa3d7RhldVKJg+9ljWKR8ld
	yRiGBSR69tRxHxtizWKpSRjI5RxcDQ73yHy+rnTPycgIBWIbRgFUqoAxeoZdN/1xLYyrrewCGm/
	yaUiB0jGlwueI6ZHngy+RwUM8+OhJPD0iPUszT2vWspcCHYyypBzSb/QT/UKJFBapMzry
X-Gm-Gg: ASbGncudUzffcWiBwTZUA9pOq9t6ohZJe7JWki972dST4oicKUB7Y89vbmXn18E1BXG
	MEvopAugVAUT8VUmNzp4UnxRR35d5BBmgbj5nu0851xZRJbSHW0hUMV6t33X+yska+UNP5IdFxs
	a3LHRTH9p8zB7QsrALC5tbz3/H0zLQAiRrKrwKDe9wf4nIdFPABEspUMFFFWSdwukIpDiOCEBE9
	YSWCdWG7HP4LFc9ZVuOiotvV55fZ9gZuSOxXtY0pii+qXHqfQ2bByG9b7LOYHrGJuY4iojG6epH
	klsYAoOinXTL4Sr4jf1bowYNuGLZ21kOZ6S0IbQ2MsNj7tQliEetlp/arz8/Td4A/4/1R8XxMga
	Y4g2wJKbXbwEGC/sZkHY0TJ6QB1gJK/VGWvt9jtLgz3lIbvYaKi0w3C4Qwv5Vbw/Czy/ywqelyW
	wicwPgUWZEPHQkBe4DfUJs+fQ=
X-Received: by 2002:a05:620a:4694:b0:8b1:d8f5:6d08 with SMTP id af79cd13be357-8b6a1af0b23mr129434785a.0.1764974800757;
        Fri, 05 Dec 2025 14:46:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxKdNzETZwLBvey15b5qloAWZxhY1ri5X6GGhsrtXkWW6ZLsd4zqB6QOkgXRl4kx2Vy/2hEQ==
X-Received: by 2002:a05:620a:4694:b0:8b1:d8f5:6d08 with SMTP id af79cd13be357-8b6a1af0b23mr129431585a.0.1764974800297;
        Fri, 05 Dec 2025 14:46:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c283adsm1851768e87.85.2025.12.05.14.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 14:46:38 -0800 (PST)
Date: Sat, 6 Dec 2025 00:46:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
        stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de
Subject: Re: [PATCH v2 6/6] firmware: qcom: scm: QSEECOM on Medion SPRCHRGD
 14 S1
Message-ID: <s36hhtayof5iyjmfglghblzwwzdjs5nltlc43ehp4oedw2kjz3@3o4oiocimpca>
References: <20251204155212.230058-1-ggo@tuxedocomputers.com>
 <20251204155212.230058-7-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204155212.230058-7-ggo@tuxedocomputers.com>
X-Proofpoint-ORIG-GUID: Mg9LRuTSE8wRAi3olFeYb3RkicFO9z7A
X-Proofpoint-GUID: Mg9LRuTSE8wRAi3olFeYb3RkicFO9z7A
X-Authority-Analysis: v=2.4 cv=DrNbOW/+ c=1 sm=1 tr=0 ts=693360d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=yDUiu3_GAAAA:8 a=EUspDBNiAAAA:8 a=6UEDtKjk7QVkTALdrA8A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=gafEeHOdjwYkg5oUpzAY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE3MiBTYWx0ZWRfX+hncjBGvCPf0
 ibho7k456nNK7Y27TAyMQ53eDGBdydsnqJHMSEh50OfH+Ep+dh/0l4fJgVJOoayGx6uN7F60rYD
 mFsw3CECHQsOM+9hFFtdsPfgGE1/oFgDYLi0vsNJ3iLFvmG+/3sbgXmdEHv6ovaDGXFukuIyKYs
 /2yn+QiwHbPN4n/KWm0f96SL2zPUoMwUJJxbOm5TTXUF3JxNiPfGHgF4nmpqEoU97Upt2/5EN+/
 Ycb3XDz+d48OehX/f/pfnG8+ccXYz3l4VFz3t2rc7dhHpliUU+jMtNnr33YfZqYV0rDTvv81HX9
 GmcgLABJJsxOI2e247M4F/IFNoeV7d/wPX/9LTog/v4egrMxyRxsIyP7hdJLJ9pUWBxQNDTSIao
 lUsaORo1/2p+7J02qbVA3KUxF9lKrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_08,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050172

On Thu, Dec 04, 2025 at 04:52:08PM +0100, Georg Gottleuber wrote:
> This is needed to access EFI variables from Linux.
> 
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

