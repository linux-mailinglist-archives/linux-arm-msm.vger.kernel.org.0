Return-Path: <linux-arm-msm+bounces-81369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A5C518EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7310B4F7CAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AA82FDC5B;
	Wed, 12 Nov 2025 09:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RPC0Lukz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEyYM2Fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812DA2FC873
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762941233; cv=none; b=mM1zl9HdARtgPyIg5OtNJeNCfa8JVFOjgyxjF+BtE9UxTQAuly1SRWT4372xPfyjZruiN9GrM9vtR3bnX2mgL0Z1Nvkx9X14VS2s7uOq+vCD2hYe7NyAX35OrNF2OeemPDNtNX+XLL3AIA/+V6w9Hx3D4Y4IDAGrzlJ1gxTmyqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762941233; c=relaxed/simple;
	bh=TgvD0GubU8kF5Dfy3yLeHAPf74ErAVmKpBp9wpxBJv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLixlfNdkgy/LgI7LkQ6k3mR9l2LjL24aac84nLD91+O/LHq3Ag823849p5osJ8jYbpL6tmk+ijP7RsGWR/WFdS36ptEyijlY7Wj1lQ7yNpqCKjtjBv7D6Mpm98dolb3L15kreMWQ9EcIPPrgB6GZ1tQI+AdBbZVE6CQk8xzjz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RPC0Lukz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEyYM2Fr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC6Sjmg350143
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:53:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/KzO6isyjPn2hyAKKNSXVgFgpCnyrIGaSRJ+1HYcQtk=; b=RPC0Lukz8Vjp4c5b
	YZxpkhFV9UNCzerc/gqcKh3Blepepc14LZGA3v8ZVzUWggPa2MFnPF2q+jsP5BB0
	VOUfKD+HKGtyedbtiMZQtalRJuBgrO0tBulbx7inwN2FhyybZjqISnoy2WAFn8rC
	ijFSrPM/VGCtfIKUUW6isAfKeQCAarZ4+m0BuWHq/S+ShuAT2MEJTVcL/fGbMSqH
	yt3ibZh6QREEFtw7uDaF48gkqhWeZ1SxfzY1tS3TWFgvl5Gi1F6uaIU1kKbUPlQB
	ljv9pfKpS800leAC7SQDKrVAmc45cVmfkFUOHD8qUddOKlOIXIIM/0G8pf0/z/cP
	VsRsgA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acn0nrrqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:53:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8823afcc98cso1482816d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762941229; x=1763546029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/KzO6isyjPn2hyAKKNSXVgFgpCnyrIGaSRJ+1HYcQtk=;
        b=cEyYM2FrOQLdhfyAYpU+jh7lyIP4FVOMvw1AejNwyowukFQcS2/QR4v0mFBKj3OvbA
         55kHFbPIY/lYKUKm0Itx/ht5wSt6uwlRsBDZLl6kz+Lw5ghM4DaetPYAYUzNG7EecG9H
         PldpHmwAxFzfA8A9h9m1tWuub3dEtpABJdwU9pEeoT72ik8+TsdFmxTuTW1yoNFtTr3w
         drEQDHaumQ3gmq/C7BR4gsvNWHxhOLaP2LA2wua1IBp/4BNlUANsSv+f8mAEDjWcNQTc
         +4FC6GQNqxiE+haxv+XAWEtIVHXxGmeFOdFXieO83mo4kWYpsWC+oEHUygUBty3s+zsk
         rBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762941229; x=1763546029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KzO6isyjPn2hyAKKNSXVgFgpCnyrIGaSRJ+1HYcQtk=;
        b=Y2AsZ9lJWoG3QRD1OxOjYFJ21BcSSA83sACiXFz9gqLkxuvPgCVncHq+sD3QxxwWBp
         EGgfIsEprxak3CXH4zLGfHd2e1VHfWePlAhXnSd5x3Y0FfWVA8Di6rfPhSaVFMbj0viG
         j5PQV+b2JI5abJ+oubFr5v+n0V9CZ9oP8IBmC08sRKWysS4DW3ZDl1IFEs6fXK3VuA5g
         /VuF/jg4d2A+FvGqdoSrSvlbRKFT/Oz8h3ElSyF7GJYmGUfKYRSPPu1/vH2mP5e/TckX
         /gfacVBUYhuCimK1H2XuDlVBp7lrl5ObODvm52EUB6VnXIKdH/7T0mgisJNf0sF3Wn0P
         dqTg==
X-Gm-Message-State: AOJu0YwNFoG9d/s+ipz4RRqG1OPplkHFVDPeYXq20kxjjQrbe9IkpAYD
	+sm6yV1uLqSkPXFqNVAGx6PcnHeRGqB6QBCwBkMTu5ygDsHGok0NJhFURuTubFQXDXdD/nJEHYA
	Qs6VfYJ7vXpgNAlUC5xWC0AnhZamo9TUc2OZqweFAv/uxxz2JNKR2GGhfc8IuzZeFh3Ew
X-Gm-Gg: ASbGnct34JRSaC30slW+jKjXKrTzXHWqipbg/DWNzWEsSF36UKnSTAmzYyKq5oduzIA
	YZ0/MhPmPhJqpkjKO0lpiJg9A0AIl/PJoTQ1HJqnMyeusJ39Mll3uCrxrg7ovRW8uKYLfmfc0z7
	cQrf4p0ZZ2Maa0Q6qWsdk8TCdupX6dGSXIxWmM67acUGuqcDnV/aeFMOPC9a+IlC5aZK8DtgKs/
	Uw+ZHzxHx/TzqHM0OvPP4nLrm7XWI5+vI3s3tbPPl/jge+vhMT07RpwP03hVBFxCCOwy5gJaAwa
	F3ejMus1Hnr8Gzm5SBlJuZQEoQNCKB0kEAKzf6ZsN2+0DHUbFW8nfLJEUT0M2DG+eiocxyoGz1E
	qqPm6j6OB2KwvF3n3bYVQCiR2NoZ/cMOz1y+axUJv8+xtphzCJIkEplL7
X-Received: by 2002:a05:622a:14cc:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4eddbc942a5mr18534491cf.6.1762941228835;
        Wed, 12 Nov 2025 01:53:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnd1F8QeBMdY8tN7HVPZ+812BJ4TBuAQZwB/mZkcDLFhNBaBtv8CdDSSmrvJaNNTNixuwdWQ==
X-Received: by 2002:a05:622a:14cc:b0:4eb:7dac:7b8d with SMTP id d75a77b69052e-4eddbc942a5mr18534321cf.6.1762941228171;
        Wed, 12 Nov 2025 01:53:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64179499189sm8534460a12.8.2025.11.12.01.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:53:47 -0800 (PST)
Message-ID: <0df692e3-7e39-4a7e-916a-c385015a2821@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:53:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Shuai Zhang <quic_shuaz@quicinc.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com
References: <20251112074638.1592864-1-quic_shuaz@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251112074638.1592864-1-quic_shuaz@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KAD2mZVWinDRzrDHkCgL8xlHK5m3f0tj
X-Proofpoint-ORIG-GUID: KAD2mZVWinDRzrDHkCgL8xlHK5m3f0tj
X-Authority-Analysis: v=2.4 cv=acRsXBot c=1 sm=1 tr=0 ts=6914592d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=bFTT718uMvuJoUpks6AA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3OCBTYWx0ZWRfX1BH/7FD0D78Y
 JDxXA2j7JmKNt+xCmqeU3J0reCrh/cu5i8AWe1g3WFyUYind9JzIqcYfmnn+3Z9YTvOA0VHxZMp
 6Rm7suIUaXxZfKTAUMZWbOa5mkvSqYaF6/YmOET1iAvzxj3xbvzIxJ/e5N8MR85H7y6loT/hoff
 tbftsSzysnPc1blpr6GSwPXA3NxwIFptMcDzlG/l4GuV+EQMJfvHFhL2rsEGpFl9Slp3TcDW2JG
 +kDvaEOfOfpnfHM7d96IRgyZXdjHwI9Ue/R5IGIx77LMAiwZYjsYu1SDjL2VwteHSUbsr2RNg3N
 1h3WQAu8QaOmQVMliumAWuU6oSBOuqgVhfeAiljrUdkQT+eKec1NmroKw3ciXzD/zpEcZMexkZL
 BW70gIZogFfIDnCZ5AtA0xVgwUSmww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120078

On 11/12/25 8:46 AM, Shuai Zhang wrote:
> For WCN6855: download wcnhpbtfwxx.tlv and wcnhpnvxx.xxx;
> if they do not exist, download hpbtfwxx.tlv and hpnvxx.xxx instead.
> 
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> ---

Would these files be fundamentally any different, or is it a workaround
for someone else being creative with filenames?

Konrad

