Return-Path: <linux-arm-msm+bounces-80073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE45C2ADC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 10:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E0453A6AD8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 09:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE162F9D83;
	Mon,  3 Nov 2025 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="awVu9mZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cqZQESdH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087732F9D82
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762163542; cv=none; b=ka/8oVpNwKBn0hPRc8thOCeRmiMJOHfrHObALhcTxWlYpgEYhqntQzuo+bCwuh3OrEIMgh1u8llOaRus/TKYBBAq8d5MydeM0lqvnJko88iYjxP7fZfoeu6LotFdr3THJtx7x98uCHTUXSJamP5I1VOFAeZQvx+4ktXveMs3JXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762163542; c=relaxed/simple;
	bh=ilouYp44rCS2DbXYyq7hh9q0vM4P/bamUocBhybD/nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuc5I9RDMbSB/u422pvzXOOa3hdql/9zduxffjkjjkAcJ0ys/whsFjdgpHM9qRtIUnETUpeWLQGQyJw1vsA8qKQFWuz8xOA0ZLQ8uzYN6kJIu9c0Y3GnpouOI+O12fpA09DPhOehhcVoWRDOso9qfZDwXSudBHRX5/XnD85UkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=awVu9mZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cqZQESdH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38lWX81172015
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9/hMynrjGoov5sKXV3QPhZeYgKZmJt12Z9R/C9Mx04=; b=awVu9mZEgPmSkXkX
	vuhMKMbQnQu4DPR1WIqoIJQM6MD9p8+kuaCMa4XlCSzY7XiRPIeEXiNo6z+S0HhJ
	gyB+HTvxEjet2wZnVCcMYpf+yRXN23b9T7CWWwautB8Em3huG1CAlbpmA04UJv+F
	6jN5CBzO4nXnwsykJybFvbU0oX3BGwSvermAk+qe+XFT+ieAt2RDyCRv+27oX2D3
	1102Gxk275LkAt9hIfm/086UufQDYJk79aQdrhsNEPFLKbXHXkGECe6FYqDg0mNn
	zFajXZbsoWuqi39TqUKbqKInwJoU4/P7BtF7qIIOZfAmu3sVp6Fd8UIWpNnQidZF
	VEXwGQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6f0w9gak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 09:52:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8801e2653dfso9155696d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762163537; x=1762768337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9/hMynrjGoov5sKXV3QPhZeYgKZmJt12Z9R/C9Mx04=;
        b=cqZQESdHgIn6iRNr7K73W3+1WM/C1fcZjIIkDvpd1OFeDmR+aUN5gpsRd9NyxHggHg
         CPnlCSqGFzqTomUen0xWVneED54hRy1ET/wzbUgPoH6W1DSYtoxRF5DrS6yEZvjHPV0j
         J2dRDJ6TnNtvgORy79ZeDwchu+3GnUL1XXxx7UGUw9ttKj7BB8saBbhHvQ4c+nTpTnQv
         h+/7nh/rFuqUhCv1HkGZvYYgabQGY47ueP2AejFnqDEzAw3Iz2iwfsd8cC9BWHCWloY6
         PW1smVfx/iIpPwKlyfVX33LW76RCGCwLVRwzTklSVLbJF3yN1jtyLIha1DFV/6L8mun8
         DUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163537; x=1762768337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9/hMynrjGoov5sKXV3QPhZeYgKZmJt12Z9R/C9Mx04=;
        b=a6Po7xdSZeaPn22hBVEtjqY8WGnKEvnn3KunNBvBb/u8hAc7o/AW/fu4LI0U6iDF6A
         baVjcn4AgiUBe1hlpF9IW0eCQ3oI01go+/gzfGuJsxjiNO9FFH3Wfbuz78IEcv3CQh59
         2+xJi6JpudyP6wUL2HZiNxd5MePaOAhdM8UNL/5tdRNKSyjsVhX+G0SyKusMiOu1CqH0
         UN9/kgEvFJ0EpXlD2BkjaWLqxOmZlz+QPnK5idt3VVqKKDRi3mwMXIl4LaPVEJ1vYYPv
         aDDq2rQ8GBoi04NVTaZnERvr6Hc2B0OXf71/WZU4x55oXkqcjegbO4xAzuKh2lDYzF+u
         c4dQ==
X-Gm-Message-State: AOJu0YxwuITmgH/taChKBs55+GDzOEW2vUbDM3N2Rx0ldtNPuf4bDaSJ
	NWoCHH7wIWynO/A1mqWEYGh7iSuAnKxKU2/Upe9u+h83J9P88NIik370ruWcYeVBaRMppauShXI
	+BLZN/ywPKatZL02T63L18AEYK1EjwYFBL/aGBwmwoKkp5rBO80ZJKDRYuNcsinlKuE96
X-Gm-Gg: ASbGncvMiJlF0zFnQVQKmEbDp6HSwHTDs7Z/LwCECtShl9WMnkgaErTY7YpJISkg3P6
	Oj742ZVeLoCdxqdiNmdB+5C566vK16taHB+70zRwMiuPjTwSsaGJkYzeMZM4Rb0TMe9px/XKgmA
	Ilfg6dRNP0ZUUO4Ruua358DQaOe6VrKSGH6WZOpiWR+BJgird0w6rPTeO0WSTPFApkQD23ouEOG
	ajS/10qU538+jrPWvafnygob0EZ1GqLEvSp/E/kK15+xDcei/M/KDZZb2I2nQvpkLVBHjsy+7Ax
	uqXk69MFjWS9nlsfhWgiI64o9wdD30GaKIhtWMNnCckrrgPwLyiFIiIdSq5x8YNwH1E7Sw27Gtf
	+IJz51xG8vVEo66T1Q020NDmEsViHBOgOSkJCh0zF76X3UC9dOTJEf8Es
X-Received: by 2002:a05:6214:19c9:b0:880:51f0:5b92 with SMTP id 6a1803df08f44-88051f062e8mr36976976d6.1.1762163537309;
        Mon, 03 Nov 2025 01:52:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMuJXaeDPuSQb7uyKLednlPXSsjDtFnz5mwdcOTCCfsl7GSBy4eQ2+uDGZPWhbH7VIlYSjtg==
X-Received: by 2002:a05:6214:19c9:b0:880:51f0:5b92 with SMTP id 6a1803df08f44-88051f062e8mr36976806d6.1.1762163536701;
        Mon, 03 Nov 2025 01:52:16 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b42821bsm9228053a12.22.2025.11.03.01.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:52:16 -0800 (PST)
Message-ID: <e5d7654e-91da-4662-9055-df3a9d9d7bd5@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 10:52:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/25] interconnect: qcom: icc-rpmh: drop support for
 non-dynamic IDS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251031-rework-icc-v3-0-0575304c9624@oss.qualcomm.com>
 <20251031-rework-icc-v3-25-0575304c9624@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251031-rework-icc-v3-25-0575304c9624@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5MCBTYWx0ZWRfX13ZcM94yccPV
 EP6jdkzEjD3wmU6qLuuwfk9uBitWl2knIpnLZUwnPxAY3rukbt7YaHEUvn1wuu+im2fpjY2+bSj
 iVdzVRtci+TRY2fZGQUj7zDFuMBVckl4L8kSW4Os4MA34eLtPwhXLqUX0yMkftOJuu/+2FPq05A
 ruLy38mceRmz+cSTpidjA3d8vLxkcjnqNV8pQ7mscajmfminI+02xD214IPXggWitPhCHu4MOFI
 IcFdJimQqgKRq2AZYQRh2QEHKhBT9fIjVCeBpNB6EA2bS3kFYowPZjuncW5lBHx4D5KOM/QxuLb
 zgef3hP6S8MyxGMoJEdD6k/SH4SUBmSgTO9/pcavzB2NBZzywC6cqErfGqkxPjyZuXJQi4ZHGbc
 Zqy+B9rnEdaxl6uG1djK1+/q/KZ7qg==
X-Authority-Analysis: v=2.4 cv=LcAxKzfi c=1 sm=1 tr=0 ts=69087b52 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=--u-uVyheMlGKQUkfXoA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: QODoUMTU8_LPocS88d_dozf8PRuo1q4b
X-Proofpoint-GUID: QODoUMTU8_LPocS88d_dozf8PRuo1q4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030090

On 10/31/25 3:45 PM, Dmitry Baryshkov wrote:
> Now as all RPMh interconnect drivers were converted to using the dynamic
> IDs, drop support for non-dynamic ID allocation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

