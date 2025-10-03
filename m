Return-Path: <linux-arm-msm+bounces-75862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B85BB5BA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 03:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7DC01AE4819
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 01:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704C9263C91;
	Fri,  3 Oct 2025 01:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adZtzzby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3F025C6FF
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 01:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759454235; cv=none; b=LDqCXgXOLT9du6U87JAYtdYEHuSofgXxswXRNAFckAVatm5acLeiK8TUFsXMg4Ju5i7UQrorvo6OyHtTm0GtDm4hbZ00h3HXym6Q/hRhExxhrzrWL547YQ1VjlzgZRymYML5vA0QvYNY4wKCWWIh5d/C573CsI8O252qEPK3KAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759454235; c=relaxed/simple;
	bh=wkhLQL4KhS4ElM81BbFH38DckUlg241GVOJ8Gk+Ooo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvAPTIKvog1m638h+/cug8QlEI9Acu9llq9P1J5GYM6iBAafv57luqtXQWRGqc3gbD3aFqRh4AeMiJ9V4czvoIvOmKAQw7S/v19uRVPuIULIWoIxYpG6Ss0bH3ka3daWBQH7/L9hKgOwRzVbQ7/aAHIOU9ENolZGtFLoA8oQeSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adZtzzby; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592GaFhv008063
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 01:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NszYJNXUum61Ftvgh9BoHIbg
	Xs/NhaLC23ASv+k9yTY=; b=adZtzzbyNJG4Qibg2lpRct8Xd0WYI9m+fpgiIP8j
	RUWhvSXufHfFkNhTt/Qd4g6Y8vxXkw43zAYs/r0yTk0bpYNl7JdldY73vSVYXhRa
	EnaS+KHtE5qBhBiMhyp0Bk/sto0n/QH/NS3Wk9wXxMzB9YugqdwOAXgkkO3K9qyV
	NeJEycjjHKmqwWbxKdLJcYd3Y/WvhzxU7UK7Yci9U6f/MHThFUhY9d0TPaQTumCt
	GCLTj7XkejVhZjM0N78nBT91y4S7v3S5RTSEjGvKzxckNfErhPQMmzSC8H6xwU3Z
	eYIHRp/S6Z8B6iHyLgdkY09AQrNaM/d5OqeRbg2etQ5xew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49hkhh2ma5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 01:17:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d6a41b5b66so42634781cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 18:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759454228; x=1760059028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NszYJNXUum61Ftvgh9BoHIbgXs/NhaLC23ASv+k9yTY=;
        b=N0YHjdWnDtkfXSWNU4bKZsmuzpiEErA3xAoFuoLnaXBn1XJtV8xeThNb2OzVu6pEsq
         guj2TI/ZJ8Ok2zH5KU1a1Cfx0i+HfVeUFFE89PK1WBTLTToByUKJohGD+z/xy7opMfCk
         rWsJH5NxR/B841vL+W48gU9e1YVmQNaJTqxjp4HT1edRkU3ixPvjEeIfUyNCn+wB+TnQ
         qYtInVGzsEvhcthhQwCGafr0XJW+pEEfHma4/KOMH7czVNdhhgHl+teTkDIklYGwPzwS
         bTtuoK4s4y50gJeZUqDaLej433hfLGTAGgX+wB8msXNBLIrrJIWz8QgHnVR92mxT4XxW
         WC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXW98ki3Ui+a61Fki5yMhtX/oMqWACrFY+NRflhpjS3KQkM05Eittyt/77isGSKNlfjL3xxLv5YH2gWO1y1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi00bKgwp1rqwiDnZPhCmaKiiYOHAmeA/oyG0F9wZlDDXQgPQK
	+d3ILfSp79VZpmmUfh9tFLYY3qhOn1468bVpIdNjNRNnGV6FU38kdBFFHjKhZKwWXq+QfUyQRZT
	JtS/+1VSQMklet81FNO7wdDatdIHgkxw8iGx6DqKWRqe3GUeW0qJHIqexaQRjP2dP3/o7
X-Gm-Gg: ASbGncu4B9YlncY0c6g+E7zmnHOKDBpd27cy+QNv2vetCjruyhSjR6B3Ab5Ii4oqfBm
	9FVTAy/+6YVJhWpHWQIf5c1O0sVtbwiA3crIkt/NuK3nu/16xVInm8zvir3y21kHugHH03tsIoz
	JK6KPjjyBPUsQV4SiO84N/lo561PuxBxpmbcdN8I0HdwKrbBUGmniBxQgZWS0Do2jWZpYbvVgil
	Awzvv9+0Klolv+Gt8luyGy0oysysquYgcn69ZMSU1+Mn/mUM3T6fu5XHKvW8SeRxIkiNFIP4RZi
	rYLx5XoiXZgAfoy+fLHx7ESXhNqFThC4ZbLhg3cimGyIkVVa6HmbmTn1kaw0/c5g3WXj1IwniOo
	uIGL/WlUMWIRNqEha6VvlsTwwBD5lbV7ngfMorhVJ0XcLVoF83UA+AUU5IQ==
X-Received: by 2002:a05:622a:394:b0:4ce:dcd9:20ea with SMTP id d75a77b69052e-4e576b13f4fmr21738201cf.57.1759454228048;
        Thu, 02 Oct 2025 18:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7wGlhN9Q1fx9OZHmwE/WJqZbiUdV2GSH/vjmHZyoClwDnnRtTJTDDldA0C+AO+Zy05bZYKw==
X-Received: by 2002:a05:622a:394:b0:4ce:dcd9:20ea with SMTP id d75a77b69052e-4e576b13f4fmr21737781cf.57.1759454227579;
        Thu, 02 Oct 2025 18:17:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113f3ddsm1316191e87.52.2025.10.02.18.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 18:17:05 -0700 (PDT)
Date: Fri, 3 Oct 2025 04:17:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Message-ID: <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
X-Proofpoint-GUID: WjWNHyrPOks5mEnPpaYlN83EIIza2HYh
X-Authority-Analysis: v=2.4 cv=cILtc1eN c=1 sm=1 tr=0 ts=68df2414 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=snQqrI5GwQTDGbkEZYgA:9
 a=CjuIK1q_8ugA:10 a=2MHBSq50hwYA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAyMDA0NyBTYWx0ZWRfX3zIKcMMK8X80
 6SR+UkCBih6lur5ldbY77Rg0ZWp6poae/ZXfHz2ijW9jNH3egJvjJNoeIlBvavtDnZ3WUfQir2m
 ovL6lodgQunzQD+8Y/w5i+L4vWR/xVlbFjVJi5D66DufrKb+0hYS9ILHXzKGdmghROy3yt4O1bP
 yB+e+iuD9gegQ0tztF6ve/EUCnC7cRm6EiVjQSenTJSQpmyJX0RtdcEccvl3N2zJSqnNd6KVRE5
 /4h1V7vhDCHf+hOd+YF77Edghhuzqc6zbiYYXxhjfP80ZKI5VOcBTftlq9x3L1f9XC/aI5uRKtG
 e2jaUtViPN8D7Lp2nzMqPDPHN8LGvGYJ5E4Qg/Z1g8bSk45Jqzg96wS/VZRzcKZe53VkuEm3v79
 j1EC+N0PEuIr4wGsnjoaRtgaLOcwMQ==
X-Proofpoint-ORIG-GUID: WjWNHyrPOks5mEnPpaYlN83EIIza2HYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510020047

On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

