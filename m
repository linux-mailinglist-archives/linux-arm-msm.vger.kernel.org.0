Return-Path: <linux-arm-msm+bounces-84783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A43CB05FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 16:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2FDB305D9A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 15:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A822FF64C;
	Tue,  9 Dec 2025 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="knpCpBwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPbEufWx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7322C08DC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293293; cv=none; b=UDadRXaN9gwNZAkHst2sXgrjC+D0DnLb/8YBS9EuWbAl2kH9lrMgKWudXkHXFNG5HMW+IxaIhxwPLFObhAjRsulqwzmF3kswIlF9Pn+a0DkkrHET6gWdZ+4j6ZZyVsd17Leb7Ege7KZN5vVhUmE6ev3JcRsLMuO8mQZSkli8d7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293293; c=relaxed/simple;
	bh=qAGe2O2qpy6ZBSJ4NW8hsCBg9Hedo84B/WVPGhj/+vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L38zdP2K36ydXPzbHeU9YUVbGzpC2x3p/fRrb/XpHUf2B8Mun7iLRGonqdZclEeDUH0O4yPYEo/zbH0e6HinuTwob8Ihyd7j/q5SS3f7U5IoLDoKyjwnqXU9GPMcSuI0w6kbSf1WD1gmBCJYaDZqCEmPY3ze7PXpEV+U54R1/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=knpCpBwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPbEufWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9F1lHB240810
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 15:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ozMgZZzoOlMa9Tq6myF/RZJR
	lUgb3Mcu/KMxieUEEik=; b=knpCpBwOhSIbGOWjFPqvig7foVKNvjLerAvrk9zi
	AsKnV2g8ZvjVbATe7sr/VQhGGFCmeKM9Yk8YmXok4drMK/3ZhikuMqylnKMSTQsD
	x5X94GgQmfNYp0mWYtp/7sYBAIZqt/Hu/a16v6NB0NTPnt/mrRvvgdgNwWLAWsWs
	2Uh/MfpjpOtyLg6fRqqzzU7cHUGGIFYR7QPrXf1syrb9sjkxiWrrUuwK55iTYQyA
	aVOtAr1pzRAlaz4j5DWLPd9U2vt6u56PmlTq0FnfmTNnMHE9rV0Fzfes4Ivs6vjz
	zUd/8a5t5cB4bvt79VHDS5QErEg3mDBh+2eBTRbeaAv/Rg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axm9c8ffe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 15:14:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b099d692dso3092517e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 07:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765293289; x=1765898089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ozMgZZzoOlMa9Tq6myF/RZJRlUgb3Mcu/KMxieUEEik=;
        b=DPbEufWxoJp0slGZi64/1dSabMwXQeLAOevOq984XH/xGT6M9TjLucosxh+x7jnj/2
         oSegH76jOs2hWSM5RFSBFFblcs+sjhZq4PpElEUiRMo/pPHUBN3aSF8w+uQQryC3NWPZ
         4uT3NWAVD0BeRGPO/ZYmU5QO9VHJKHHsnvF389ChOQ4q6YkUUAc8kIEzlUZQjf4J6fzJ
         4G1YG9hWBYqeiyEO9IZJmL1yw04U0Bvf0hWahM4qMscEWXJxlfEI5IyEF2RKis4CMJIK
         sD4+kESmTKimGM/IycY7gATxeRKQTCs6dQ0TVsqJkXSZ8n/A7iXzutTpmyStzBLZD++7
         Sfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293289; x=1765898089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozMgZZzoOlMa9Tq6myF/RZJRlUgb3Mcu/KMxieUEEik=;
        b=q3qwkXbgEUI8sj+E1ogz3j8HpoQGmwCmZby2Z4fJbKnItE4rQBV7ApzfkpK/BEQuwO
         hbMxhFlr2l3GkpMRNLX995NRuNHeukpvqHnKdTMH9zCAfkFQMv4cOh4ZifkC3ZVUgz7q
         637EcxzB7v5iz5Qqb9dU+DTwAuuw/q/8f3/8KaYlP/gn0ZK8543EZ55QoyN+2P9t1GIb
         wdVchVA4auO5E9/FxlC8w6kz9TnDOud8HeIsGKl/00S2lF7t/3zI2d/UY2ubWW0Au/oC
         UuFLn7P3VFhiKPytJMIIicvOFS1EWBWl4y8shIHCYlpuztmR8EcjvuMYPqDXULXVTeuL
         Vu8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmXWXgRXmZ0S5kH63fWqokuk56Z6KGBHUvUlIaq1a9bkz6np7i8M0DeVPKIWI6uV0esps2PkZkz4xVhD7B@vger.kernel.org
X-Gm-Message-State: AOJu0YxDxQFlYuDO/nV6nG+VFr5i7PXp1LWTc2yeys6vv5RgSDQ1WNTr
	STFDwO28eBZhhzKFAsOnJfBXKsYVLBOVBNFZfBLUzUKOQ+bJ/tjupWF4AKMvmZyUxHcTs1RTH2O
	JBnMFXq0nN700x2/iHN8JjgBPjFPxp9JKzZeItFWuzaZ9WjGUaGAbLC9aZw1aDI4C8y3BYHyEuO
	0J
X-Gm-Gg: ASbGncs9IN0xW4dCPmbT/IH0z9+bfApN00nJeZi3X/5jnfyzzj3yPgPkvBHwlZ7XBVS
	zIbcuPmsOadyS1BiVpaHWRzdufDCUTaHUP2zsIrLholHJsZ4UTYtbEGniUqpRWU9C8UnID8UUBH
	4tQTEufdE62AxCP2QUmRwrqaunPWMdJpHuBCLWGtbPe7dU7+5wqmozeRYN6OQ88bSzjrZ4/mlRp
	Dghi+mNct8lbD6T834NUY7xKEQs5yZVXv9YnwljAJNSZn9ux19gZyPLiK17/5CAZJ7rdJQ8zTep
	1KFWaP3uSHNqgWOhkRKHtVJ7vWmYbREt4t0BfhiZnDh8/u2fbLuOtGf7YrQ2p/U1pLbDrTYOmr7
	V326WC5hi40gsdx2W39t8BL2Mjh5XNkEF4zAovLxiXV++hIBuw3vFMDa6rWDNgp7qVOiK5ZB00O
	ALFL7pDdQBAqAn3i0Xu8LKXSw=
X-Received: by 2002:a05:6122:1799:b0:55b:74ac:72cf with SMTP id 71dfb90a1353d-55e846d530emr2938578e0c.17.1765293288916;
        Tue, 09 Dec 2025 07:14:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9M8JZbVA1dMV/09RyxqBOyLUyWQsBdcFok11K77e8eS19RHj0RBdHTeZO0gCwNRV+kTSK6w==
X-Received: by 2002:a05:6122:1799:b0:55b:74ac:72cf with SMTP id 71dfb90a1353d-55e846d530emr2938564e0c.17.1765293288414;
        Tue, 09 Dec 2025 07:14:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597dfc536e8sm3629912e87.7.2025.12.09.07.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:14:47 -0800 (PST)
Date: Tue, 9 Dec 2025 17:14:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] clk: qcom: rpmh: Update the clock suffix for
 Glymur
Message-ID: <fece6e6hun7a5kikkronyzphrdbrl7owimeomrhddt4zluqkld@cixvhiht6xy7>
References: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
 <20251209-gcc_kaanapali-v3-v5-1-3af118262289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-gcc_kaanapali-v3-v5-1-3af118262289@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDExMiBTYWx0ZWRfXwQ/WMzHacO0u
 wW2N4OVW0M4Ql5a3m0iJP9N2mjtHLzyJSDVTwTDTHcOoGugwWVpW8e01QVYmJCBN4srzVVtQSDL
 A1k7IAc9ipg/5Tskvxszb5j6vcD1CoPzR1OHDB2bsgRpVjcVhPMF5BX6AW6x//GMqzIOHlIAZDe
 BC/fHbZUZMStapJP//eDs3oX+OkLnwFB5Vhx0E7cTcn4nMetp1pu4DwGVxIY2tNtyqrrYbTrXDU
 CZx1z5brl4buMu8blXgQ5WVgArN5qgtwrS6ki/01AGYvob6I/fF10qBow8+w49OS8Ogl5ImyHc9
 dXxmYdpca6ajBBcgsUAMwHLo65thY0WZaqeo41V4eOrve4FEdxUEdzHIlQXOHvJH/yHxRvhcu/J
 UL6YU5Wkwvp4lvIRIcp4YBChtDIDRQ==
X-Proofpoint-ORIG-GUID: OSkeL1XQxgK2Olnm2MYMW8EjHzTlexRt
X-Authority-Analysis: v=2.4 cv=Vcj6/Vp9 c=1 sm=1 tr=0 ts=69383cea cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ytHSg5rVBPlbEvibhtIA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: OSkeL1XQxgK2Olnm2MYMW8EjHzTlexRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090112

On Tue, Dec 09, 2025 at 02:19:24PM +0530, Taniya Das wrote:
> The current RPMh VRM clock definitions do not accurately represent the
> hardware mapping of these clocks. While there is no functional impact,
> this update aligns the definitions with the hardware convention by adding
> the appropriate suffix to indicate the clock divider and the E0 variant
> for the C3A_E0, C4A_E0, C5A_E0, and C8A_E0 resources on Glymur.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

