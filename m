Return-Path: <linux-arm-msm+bounces-76226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB3BC1E02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 17:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A39B13AF85E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 15:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5203D2D839F;
	Tue,  7 Oct 2025 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNpjPcok"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D92D8363
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759849902; cv=none; b=PgQB9L5tHjxCK2O7SetX0ON2yaaDkn4fu1PkLKio4uxuEIE/uEtv/J9YwDhHOekQUkVOQ6mRMwfURKdaUkZE8OEw8GEO3vqnulN63jTtFKPSW6+Uf/EwnTfoT21iY2uVLEYtyqRfYIP95UYvH7RaPbIRYl9lfIzZtvLvP3dEESs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759849902; c=relaxed/simple;
	bh=S2CcnT6uf7Lq93wGo0HkDBa3P8TIJMzR5H2cUXX/K50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6pXnz+qQ7FVgQUQw7OEf+Fa+W+PWcmQYYqsnu45EVmL52ut54WrKaSmTDO22ILuFnwMrp4AjFmAFTmppHOEStrk9QQADAhGORS837NTg6Ge4zOww618sowv+QfpmLqFJKzxGb8e/ZXOyRWX8LEsRxSWWp4k1bDJUoLFSb6MMXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNpjPcok; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET7pk006378
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 15:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uCA75ovFs7WYpxpgsqD2ctzMYhiu4ihLhFDOHVz80Ko=; b=SNpjPcok7zB6rieu
	yawGefYN+GCDtAM6LkKqBPnW8tSMfXOCYtyTMc0tfo8AEXnmhzJVFyl3GdKKFOAd
	Kd1xdxaUfBt2xrYMevWIzul1Te6oQn/1fwPSHmrAFocJ4MwNcHxBvOJDTPJSXyUs
	EOjAUKBi/4Xq96nyuknaA1K/4ZTqIycGZ8CkeuDguqYvaE0YrOkKiwVpnww1lOni
	ampa66/SVEnCazeEQIlcRCXT516J+BXM5Qp45PRFeEduP7uLEMdRTTAzamihmNeS
	xtxJcvP/BSMVNDCM/C2ANoRGjaL7eFw4vej5yJJFja2lj1t+OhFSy1UxHPT1/cVf
	JHy0Zw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7qh2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:11:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ec67fcb88so5241914a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 08:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759849899; x=1760454699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCA75ovFs7WYpxpgsqD2ctzMYhiu4ihLhFDOHVz80Ko=;
        b=H0gXKHJ5pr+Gwdo63IMd+QqIiWdsTHNjzMnJJJkboSOXGaMkn9d1YVMTv4lGp+cmip
         2zllNqyk8tXSpDgE+kTZU6bYEWMn2dSYMRCdYUmLWyh2yM77MFaK1FDeHcXLtMH7j1jg
         gVnq804Own9KU1s3YLhh2L9C80aHPMNWHesqiVOo0/gzjQBZgCRoOqOxLkUfMoRaKN71
         fEkd28zsHIBBRxtjfLJdk9h0LxsEqyDXLfFS8Kx96pAZB4Du/QCnfpYhXyNcOzKFHfTj
         N62LhjaXW/gxE/KxOMTvLxAo8sQFFQcrdQZA3IozzTUMcxxJeJip9HN/7091Ps1Qjkv3
         +v2w==
X-Forwarded-Encrypted: i=1; AJvYcCVntEIv97Am4F9RMorIjGgjixg3rEIex2wtRhi3IZjz2tE8WqDbUZ4GpAtH2cTSEpO0IVCl+a2msS9Tex5q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5fKFiohFbTqbXMtIGqQpB9uBa/vK4hTACKOHrDCgKWtPnPGgi
	q+lWiue36pTsAkU5lKTWLBxdin4WRebQlaaN0l3Jfnt2jtLKxB1CCdRKGRVqDMwr4ed/K+uqoda
	M2rbHNWW/PPTvkVFVqAySnRbsmDo8OPfJ3xM9W2XEYsDXl5LloQrnxmLc/VybBQ4zLNBU
X-Gm-Gg: ASbGncvPf+D1NRpXYYmj1l2loihY9t3I4feu4ILOUEsAUhf78VpvhohtBG+m6je9YDW
	7vL9+BjN2wXx7rLyDgF092vXfXUNys25BzSr4bEm263YzgT/3HPljyD2n37Ju3z5d+tO8iuH1p7
	4SeIpEKUhRNjukk90s9F764m/+b7L3vDaet8A5HiXfJvNLKj2ZWaPuoXC/Qm0XoznzY7N9up11K
	ey9jLeEou4saNR1QU+60Os8FGBdghtM2KeA2o37/7vZAcCRgZV9ECUz7WytzfOJZDx6hpcKNl0C
	1mCP1qyBhLXiq0nJ4k9rx+2MELC/iXSD/LrrGLy5hT7K0MPFRstvsLoPm1OO9bNQuxWmumLykN0
	f14RFBokIZrcTQ1okJE8=
X-Received: by 2002:a17:90b:4d11:b0:336:bfcf:c50b with SMTP id 98e67ed59e1d1-339c27dad9amr21678580a91.20.1759849898645;
        Tue, 07 Oct 2025 08:11:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3I7VC9a/jcViDril5V/qXtysglpP2dfI4f/ovpHc4k6R2PgoIIlOhxtAVX8C0BbEImTbPow==
X-Received: by 2002:a17:90b:4d11:b0:336:bfcf:c50b with SMTP id 98e67ed59e1d1-339c27dad9amr21678538a91.20.1759849898050;
        Tue, 07 Oct 2025 08:11:38 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee9218ffsm1595226a91.4.2025.10.07.08.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 08:11:37 -0700 (PDT)
Message-ID: <9668375d-365e-484b-b9c6-076527efc6f7@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:11:35 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix bootlog initialization ordering
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX/aRrk7yy4K8g
 nxTo8eKPn/cZ56ZJxPCL/DQEPozcM3nxajIr9Ill2FbT2ltmtsELktoRWcoLArGmuPz4bC9mov2
 BhM2kLk+608Jt2QfKeVVaG4LSdeo/2+gRbdEJOg1lPrPyA2ghVekMs9F2pMslOCgRlU92j1xep2
 9jbq/bAVed2qoDadEzYnjAnkAJ4OQNKC5TMFui4cgPMSjdIabt5HRUk/POVO5rN2/GY47X9VSb4
 cZurOI7pQFlCA91i6FlI7D6eESHRPX4oyhEuQGBDKvPkvvOPoCkryQBoIA3Wzl6VTZHKPIgcN1t
 xsMOqRrLza5jU/N54BflhNqk7rhg2vMl9MZBrhe5azC8Rq7GoB3Asang3U3yVEJ4bUVS7oqgWOh
 PiNwqTLa9HlBoum2MGt53v9F9MWSdw==
X-Proofpoint-ORIG-GUID: TB-Ja3Zi_NPnr2pTn1KlGDzMy1JBcb8r
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e52dab cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=haWFd_X1g-iGgqmt7XIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: TB-Ja3Zi_NPnr2pTn1KlGDzMy1JBcb8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

On 10/7/2025 5:57 AM, Youssef Samir wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> As soon as we queue MHI buffers to receive the bootlog from the device,
> we could be receiving data. Therefore all the resources needed to
> process that data need to be setup prior to queuing the buffers.
> 
> We currently initialize some of the resources after queuing the buffers
> which creates a race between the probe() and any data that comes back
> from the device. If the uninitialized resources are accessed, we could
> see page faults.
> 
> Fix the init ordering to close the race.
> 
> Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

