Return-Path: <linux-arm-msm+bounces-61916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE276AE244B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 23:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67B063AA45C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 21:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BED239E60;
	Fri, 20 Jun 2025 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oj/OnBdd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09B723958C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455882; cv=none; b=pBeBLtgg2K4IQIkJDyJ5wrDzF/g9t93Yftk96Qda2BFJBnI6kuFQtfhJ836JPAJAdrskKq4QjGfcwhKRYPiUa0eXClws/Ms2VOahse/SX+5GVeGZ7jY3PBAl3MEXti4+Hco4bWNCZULMfS8JZx9t7E6ifd9rHyDt0gT81f1W2XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455882; c=relaxed/simple;
	bh=YzcmdcxDrTekUG/seNJPMliDEDlcxMooWnagOOkCocw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKyDk/V9WfqgoqWSx4azsYCiNbF7TQK8dSpPO5bkvP/tiCp94kPcUiu5ztyzhXyI54JbQYNhx7vSjJQTdW7ONumld0wUf8Zu2mQFjAFRj6E1yvWmjcsehunVb3/pSFM/cSaOrVj3RPxPZa9ZS1KhWh2sLGDxoDT+iMUKj9+kDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oj/OnBdd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFRVBd024303
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 21:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ctwi2DOqfjI225KB6TOH6mB5
	C8TUDi02E4qF9W2x+qs=; b=Oj/OnBddlpiCI0Z5jn8m/1LaNtcIfXnwUDKZVarA
	8fhvrVFSdvAFaiBYnsfpznrEZZNwD69Gy9fEP5ssJSYSRNzgwNcZKD2Gzae37R/e
	WyKbY1QrBWF/QT+jOwEaUvnOOsWAM9OEMCFXNbGXLOyKCecPrT73RONWFtQrB5Li
	HF1YbVyEc1zwwKhzsbUGqGj0n6fl8QyjGOlSXIxslW3swm17MoV/sn2PjKS1RCVX
	PyFWWqDhpcmu7taBPB9NZLg5QUMH52GvcTasH7sHgFOIpch4Wvi+ecwU52MlqPhS
	AF3hBkoA6Ol08L+ySrLGnBMH6cK66CpAt2K1aNPvl4eCSA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daa4rt44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 21:44:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso340546185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 14:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455879; x=1751060679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ctwi2DOqfjI225KB6TOH6mB5C8TUDi02E4qF9W2x+qs=;
        b=CdeaNLIiByZMzIVN/DshvbfOqSBkFqYhErpL1uZddJbb9hqqXDXQ3wCA7TvK1nX/Rp
         7F9CP/vw+A3WYOncs+Elz+dPV1Yh79s7I/bl50eyKW7FIF13v9qOXogNpOjZaPSP/tvW
         PtymMTU3AyWgEuHHRWbD16FrANDBkp0eS6qduZfqSMVfv7vy/nvammOQln9SDmVscDlY
         BN+p5rxzUPG5VVH1rM6xOdd7kXGmQZmyRFjHoW/Bgg0nbmActdAJ+TySsRb0iVBThaFG
         edVqhFP9wKbRtwTAnIlTjApWLHBnZVsJUGGRMafnCYey2xEHNrOq1Qde8s9mVijmRYba
         ltJw==
X-Forwarded-Encrypted: i=1; AJvYcCV2KwZPiftmWH2aNEu1BfBcUj5LjUzBrz+zhnMRXxoVZcN7S5qAlsAzvhce02h9Nn1NGXabjih+Crhr/xlu@vger.kernel.org
X-Gm-Message-State: AOJu0YwggmL/3Y0XUiwfMS8P8PysSdmOo0j5fjh1qlKoxHlmlEvpUpUW
	MMWYvuXufFBkLfZTQgxSButXFOcSZolt2MeEKxe95XJGsk4eKBhtGTfEfuxACgwlbbC6I3bLkYG
	rQ0mHScpSSLs5k7LDwrRxo3YVlU7g/0vDq4ckeuli3y/T2rTzAO8TcPMFehLGz9TP/UQl74n7LF
	snUuU=
X-Gm-Gg: ASbGncvkgCbO06y9W4wsgmo1xmVC+yDxX1S6pwZNE2GECg6oTNqGT+cggCyOTkoZl+r
	OJ+vYaAIe2RB8NiDW7MiQH3dpSzvfpXKiDT9PS5r61Pm/lEsGtaNjlE2j9lyLuh8qu+XHRoVW7s
	5sPoo/RlaDAW8ySIx9ZKcVnzgwr+lzzHnzb7JG1V+Vksp4Gy/AIaCClW2tBywNpubH5/bPftDyh
	bMTDxWKf4M/m4gnsknyokJD3H82ulBLQLcSnscnZcZbMM4M/U9YyzZoAO6ldh7vEA3z2+jN4smU
	HzMbQsm5EWir2RjuNsRshPlb+dtyp+cT6KUFkT7dJhgGAMqPgffqA9wERWbPHWHTd9zmNY1o55a
	BmRS7BIKa+eRy9VvPhojBPMdzEDnIgd3sddY=
X-Received: by 2002:a05:620a:25d4:b0:7d2:11a:5d07 with SMTP id af79cd13be357-7d3f994c66fmr697118785a.51.1750455878655;
        Fri, 20 Jun 2025 14:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZvdnmqP63O5PRRl19Y/9Q76MA6K05Mv4i76MtyquHA2RkydgG8Ih53vLnCssRj5N3PUcNOQ==
X-Received: by 2002:a05:620a:25d4:b0:7d2:11a:5d07 with SMTP id af79cd13be357-7d3f994c66fmr697116285a.51.1750455878264;
        Fri, 20 Jun 2025 14:44:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a3631sm4223561fa.67.2025.06.20.14.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:44:37 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:44:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 03/11] power: supply: qcom_pmi8998_charger: fix wakeirq
Message-ID: <e523itylvfmikypnic7exgrnrtr6ocjmlvtozmgbhqos4lpcdm@rfsqiezqb5p3>
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-3-ac5dec51b6e1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-smb2-smb5-support-v1-3-ac5dec51b6e1@linaro.org>
X-Proofpoint-GUID: X9D6ENCvpVzMKWSFnv_40vh7wwGsRcQ8
X-Proofpoint-ORIG-GUID: X9D6ENCvpVzMKWSFnv_40vh7wwGsRcQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDE1MCBTYWx0ZWRfX9rI99gBD3pPH
 sb96cpqqfEjWzhdgC7BHpbe37LFR35jbrmZaU9YIUCR4/KMSP16yctHh7TuX80SkT3Mo2uDYqFn
 IWAqqO/O5Ii+czyNPenq+wBji2PNsHN4QFUgKMe3AW+KRPG05X3VnjRKIJ/UYw/xGbM1HAAN9GE
 PNhcuzTOpK6M+3d6z5wNvbpfWW9Sru+DiU/P2qwmVNAcNnaR2m55rB24nL3QDtsKaAhS5rCw7V7
 DK8CzzFURBbgLXnC5MJLHfsC/6KbHL4jMXQOv8tByeig5imSkT3qr31QVvPcDTrWQTTR0Cu/Wy5
 QSmokqexUVxuqZ2B/PN6T+UNRHPxGo3+wemCX+LTsAq3OYuo37dzXdfyY2H7K35wB5CDXejDrFL
 RrlCqobPa7J/Gk+a2/8Tk+57w5cwbIKT3zwUuaifpmw4PtaU/hfBhj6/5Q2IsRueZbql2qhC
X-Authority-Analysis: v=2.4 cv=KphN2XWN c=1 sm=1 tr=0 ts=6855d647 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QHKHbuR_x138-IVXrqQA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=846 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200150

On Thu, Jun 19, 2025 at 04:55:11PM +0200, Casey Connolly wrote:
> Unloading and reloading the driver (e.g. when built as a module)
> currently leads to errors trying to enable wake IRQ since it's already
> enabled.
> 
> Use devm to manage this for us so it correctly gets disabled when
> removing the driver.
> 
> Additionally, call device_init_wakeup() so that charger attach/remove
> will trigger a wakeup by default.
> 
> Fixes: 8648aeb5d7b7 ("power: supply: add Qualcomm PMI8998 SMB2 Charger driver")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/qcom_pmi8998_charger.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

