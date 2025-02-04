Return-Path: <linux-arm-msm+bounces-46887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDA6A2780A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 18:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B368F7A10F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 17:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE6C215F45;
	Tue,  4 Feb 2025 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6w27GDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6462B20C494
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 17:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689110; cv=none; b=HSHc/tJtXykkG2voWwHEH5wkIjZGnqeruay1YoMyUO1OXIdeKnn0oNQXHN/vdy8rkGcDqGJofkQFqQxUXKTNyOSdmObxOv2QCshMU4psCP1xeOFEuy+Xqho3lBS2bYsqiA4U4xsLEfkiiydkSg1ZbfVEGCaFm0uqSPbOUr+MTXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689110; c=relaxed/simple;
	bh=wJkDn7YCFok122WXw1rCvRoFmpC55dJo2sQ29BMI9zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJj8PRNBxC7DgFrCaQAiiAZpfP5FX/tsR+l7VUcWLgdCN2I2drHHsN9s1tNn/p57zDWh3O+voPM/J6tMmPxrqf8XSJs/gaigjmKkAztyKrX4czdJE96vbDtyY8IXxqPD7LmnLHiDiuroAxsrmM4XH2joL+GG7jyTe1bw/qAO7+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6w27GDG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514GuZmn024444
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Feb 2025 17:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93FHj3TQtDW6kBe7tNjNj9/Gx/ttkR4OUn4cjKP3MWM=; b=S6w27GDGKpMWBShq
	puqoKWRyxACijeF1GA4GzGacnVCm/7x0/qzqsB5rCpD5wxbhSYalJ/c61qKogxdl
	PtBwn2iNvUdqS9LFXdDEFiXwZoNYOefrcrbAcrWfE7DGdGKrY0Rnt9HPZ2Nvroth
	7sssS+QcTud4cpTkaJ6qCPHQINoJt/0aRRo4s2lBfNSbKFpasJni9sLyPXFGkKjP
	uuOLySMNRNaxkzI95/GOMiBokMmUXv096WCWZCYvsrZGQCnuGEsPNNPZbYTFSXF8
	dG84FFzph4G8kZ9T7FZpIdcDcSlsnTrcZ0sAz/kChyKClG27Qzdr2WDix4Lwv5D+
	I5kBfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kpuy81nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 17:11:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f9bf2d1c7eso2061275a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 09:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689107; x=1739293907;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93FHj3TQtDW6kBe7tNjNj9/Gx/ttkR4OUn4cjKP3MWM=;
        b=ZtxO8P0prDH3lKTXTO2Vv8Ux8pj+2Hpl8DZb98KUfbeGev29O/Li9HyEnCqbS4r15Z
         yP1UeKlsR4cekus1ahcnChHtcKwutZaXDSSSr4RgY2CzgDM1IcRf0CVqmh08881L75AH
         DUVM+wlrZDwTiFVSFvOGx1asFFpC2G9Q3TPcZDFG1vWggEsNUAopV7SIDiwsIajfgUw/
         4AbBO6eoBoPL7EJCxt1w76TiF+diTuRLuU7zvtl1SaTidHF82+fQMQw0CVpp5P1F52cp
         PHXi1y2aExMHcdDa3lwjCUjqiBPaxHPZMgwhm8JGemiglIEQ6mIaIVsh1rXh+axy8VYD
         iWTA==
X-Forwarded-Encrypted: i=1; AJvYcCVXxoIzvAnMZ0mbK7xsHR3qV+UsSwN4aFjh4EUMwr+qV75G68xZb8vZMFtJ0zvRoTpBE/SpRJD+vRu59FHg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2zg5FxkCFHzl9S58ynevDHJdgaTHO18AzA5FM0gMLXZziWK/7
	QuW+hQvQVDaiUTD6Ez1HED4eIE+S/+tLKy5PNjxuK7FjFINHnEABJdL8qwUrwxg5BTQrx1+Yd/7
	KzmtAIlh7bdKT3IMx06N3PRPJUVW+8Bq+IVCmgOT72gOSjKU5jJAxsUg2j0ZPXU90dMR1T7dH
X-Gm-Gg: ASbGncusRQXFlrpoGJgLomXnFvwF5X41/5SOPAdcSwYhamSCZROF1SgGtC10h2otRTd
	KBmo6dq/3xY4aTdyNz2BplS6BkKhbuWHhha0mgdsaIRsC0caakvwQ9hhje8Xae+oA4P7I18x9Bp
	4UqL7UDWlN5jafV1lnzvPr96zh4zho9jeRPqCkKTE1GIB9wSszWtU08T4+N7AJg1ozyHOIVcArw
	t9l+kaHl1CQ523iFm5tnPCo6YW/I9vt/o83YRixe+h88x3ZpdKpRpeyzhKelEt6PFa5TJ3Z2jVk
	PlcaCs6RTmO6M7fF8llKy4sOhNkBobcip4bRhoNHezfkEeaxBw+VZR7xWSOh
X-Received: by 2002:a05:6a00:1d07:b0:725:e325:ab3a with SMTP id d2e1a72fcca58-72fd0c14ab0mr35785524b3a.14.1738689107317;
        Tue, 04 Feb 2025 09:11:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHf9sTI3/bERhociH7aUvlwtJRs44kD1fFfsK6rqdKU/2j492U2HrA4zfIg5B8xfpPFbMd1w==
X-Received: by 2002:a05:6a00:1d07:b0:725:e325:ab3a with SMTP id d2e1a72fcca58-72fd0c14ab0mr35785491b3a.14.1738689106909;
        Tue, 04 Feb 2025 09:11:46 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf8esm10824195b3a.28.2025.02.04.09.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:11:46 -0800 (PST)
Message-ID: <c6e4511f-ee56-4df1-9dd1-1ff47b2c0f0a@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 09:11:45 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, ath11k@lists.infradead.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org
References: <CAA8EJpq6P=ENtPHxAseD2dbCmxLJ2g-YVrNHVehgQh4tHk6tdw@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAA8EJpq6P=ENtPHxAseD2dbCmxLJ2g-YVrNHVehgQh4tHk6tdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XjVCXkHWEIu2MeJNOWT9Yt8J8OaRPFxt
X-Proofpoint-ORIG-GUID: XjVCXkHWEIu2MeJNOWT9Yt8J8OaRPFxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxlogscore=907 spamscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040132

On 2/1/2025 8:03 AM, Dmitry Baryshkov wrote:
> Hello,
> 
> With the hopes of getting this into the February linux-firmware release:
> Please add the following BDF file to the archive
> 
> * description for what hardware this is
>   - Qualcomm Robotics RB3 gen2 platform
>   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> * origin of the board file
>   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> release, licenced under LICENSE.qcom
> * ids to be used with the board file
>   - WCN6750 / hw 1.0
>      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> * md5sum of each new board file to add
> md5sum bus\=ahb\,qmi-chip-id\=1\,qmi-board-id\=25\,variant\=Qualcomm_rb3gen2.bin
> 39b270f43cb6d733cde607bf2b23e2be
> bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> 

Qualcomm will handle this, pushing a BDF + regdb.


