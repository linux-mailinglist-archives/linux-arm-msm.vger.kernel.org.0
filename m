Return-Path: <linux-arm-msm+bounces-64061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DB2AFCF3E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 17:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AEDC3ACF92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1172E0405;
	Tue,  8 Jul 2025 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/8PXRlk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC3D2E0B7A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751988408; cv=none; b=E4721vDL11Yv2xhw9Z4Ckze95GzSt5m7a6M3WtVEoM47P2GwFh4543tVLOVBn+kO1KsUrkzVPNvPDwMfnvx7ZhesSNlpTfSQdwVleP5cxTTEQJkoSqlyPIb1Tq4dkVZAxhLQ7k7fS3HVwmxwUZw2dw36LE8sJNDOlkGjVShQfLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751988408; c=relaxed/simple;
	bh=gnFcMWECjh8hfQ1yd2SfwpGlHMixNNs4Ef61UrfZ4Ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcGyZyH+4dN7VRi+cbGR3S1Dz0oDcrQlY+eXzNJ6tDN1SgwVmhS/OcSNc4d+zMyWIn34uc9mckcH3dKrRjCVi/1vyFwbHhRCjDp/G4NwtiHupdLIUjJRz+Ti4KDwwRbVSyAZkaab0BmjKAFzvKAdn7Z8eHT+dN9WtGyXRxJyulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f/8PXRlk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAZYu029312
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 15:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uJ5c4Ex4V45uMVfmn0t7vnp2Sk7utC6FuBuCA5pmFFw=; b=f/8PXRlkFNlBlCHp
	WrOESPyefV136IgZp6GGYZMhFvcuUHSleRcq8k5UVr2eeZvnXNyHTy9kZ+lSV1lL
	ZmwprIZUtHF9f/iRw+bgTdrMkimobRdrkF6PJnmD9LD/KJC1KmkQDWNqYMd1wUhm
	cJB7cz36C/6HxAPNJz1kC9tnLWI3g7Fgu5QJkFJLVE02x9koCMtCkuAZ2RUHULyN
	sxzPlHw45raust6sGM5jBsavnl7KBhFNT5oMjGuJCkHbMaJ10B9x8CprmDzCCmHj
	kRXqDwLQ9/ktVVTYM5DfmTpfDUyuuhMAd+OGh9dJa053cFz2KxmbdEv2mC+6PnDN
	b04qkg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b77ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 15:26:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979c176eso45077185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 08:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751988404; x=1752593204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ5c4Ex4V45uMVfmn0t7vnp2Sk7utC6FuBuCA5pmFFw=;
        b=O9+gb2hc3MB+3cFWf3u3Nmp5dpdJM3PvfWdgUwbY8cRN6jk2iRRvkpdBZtdbHKNrYK
         zZEoKxZBTJSbmI/Q1+1PlLFVNMIEzDmvn23agK3aAh18Wf22ha7numCw56KIkGdEartT
         FJJZyeQu9wGBfXwoRInvAy4PpGPXSoKCb79+gflbXYkuYXSBdTrv8s+PlB2zN/7WG6Js
         yr+qoLOeOPXixfox/4aJvfC5Zr1xZJBwuM/nd836p/obJAHmN4J6D03s8LccuYR9y7f1
         kr8U3+6ywFOEC89/gsPfnQctEaE6DarMuD8H5RT445IQd7FODmEJ8HLoN6pYdA32hGrV
         0dqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsX/NYOvOjvu/mZs04uc+b8mKdDEs2vRsRSAmiuzXNPFQ656e5s/2ydH/I1igkGVhviLy/oXK7ZN/IIZjM@vger.kernel.org
X-Gm-Message-State: AOJu0YwfPJkZXdCnGouNszRbLPd4WR64IPrW6M7+tQVKTn2MibfVGwa3
	8U2T8mzepk4rB6XiTehNMp9BxjUvkknnQ4tVEMsmUP5tDM/fSvLcsVCHQ4Pl2Dh9XlakGCc2Qw9
	3VBspJ0lw9SD0oV1g8nuVP2F+oBeMYfb69fCLn5++WKYPJihoswmLIsLmqB1f4Xek/9IO
X-Gm-Gg: ASbGncu62UnDO8TbdQhXhrErGeUVBK9IznEsj3KKotm6xOrM/A533d0F1Yz82WbApYU
	DaOm+7piysyghIfhC/dQED9MeOJWArjnR4caNMfyP/uob6mnhPBo3YsqHYE7TzuY9FT3iktj39b
	IRVZMh5QqrItdOnyXWtj4hiLm5a3FXYxB2+SiFDdCgHCAdNZVHMqh7jEQtXwPZc6+yv2WTbfd2c
	4DnfKBZqzP96tvTGuvCXpgaMT82dBCHDZZ4gfRHz/3fpxARd0SPQF3vd+vMCAWrTsS0JHQ0JVrc
	/QjUuucO7VydohGVGJo2eHVCsRCb1XhcHSDFoRnXgs5dKNSj8vpQFM6RaRmAx1xwkWe9kM590vc
	l3Yk=
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr851143185a.13.1751988404360;
        Tue, 08 Jul 2025 08:26:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV+dx63so/JwFVhtlOU36hB2+dvDxeO07jXcJX9Do3uuZjKu3CTF/zKenMN3RLFlcDYfZZiA==
X-Received: by 2002:a05:620a:440b:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7d5ddc9bdd4mr851141285a.13.1751988403905;
        Tue, 08 Jul 2025 08:26:43 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae40eaef164sm701281166b.136.2025.07.08.08.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 08:26:43 -0700 (PDT)
Message-ID: <595c73aa-17e1-4d00-9cbe-abfff813546d@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 17:26:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT 1/5] ufs: ufs-qcom: Fix UFS base region name in
 MCQ case
To: Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Bart Van Assche
 <bvanassche@acm.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Can Guo <quic_cang@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
 <20250704-topic-qcom_ufs_mcq_cleanup-v1-1-c70d01b3d334@oss.qualcomm.com>
 <xujhcaw2nj7mzb4cspjsxem75lqfwa7ivnfpzccor7npdu5d7c@xad5hx4b2m4e>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xujhcaw2nj7mzb4cspjsxem75lqfwa7ivnfpzccor7npdu5d7c@xad5hx4b2m4e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEyOSBTYWx0ZWRfX8vhu22vlai9E
 Vvf1W5zduzGFVSNEADl4AldZ85ZSXoqA4f8SK3iKA8nmm6BqBp17mHBGdQNYAv6+vR7oSguKie5
 YZHWQ9jT7JLXVEI4BSXGMthJ4oEHg+hQEPIE2QoHne/zi+v8DuG1hTxUVcqlBSLzj3amL4jw7jJ
 K2y6U23vcDgc2Pm7DuD3ud6Xa6ctWt9cG+k+sNnI7tYKyOEAmkPhp4Dut0INmNEptmhVcGv07aT
 co24mTGJZSaXyduDrk/YInFsWYqbnocFRrNgTGt7z2IvmrpWsJna1EO2yLunhqwc3fdJuI5pHeb
 /Iyx8g4Ybjh3rFHIBMG4Sfv97gRWYPmAHWhdmh3nShURB3ucAcV1Xt73DMYWg/v7VWU8dYUDaS1
 W+i6C9SYMKl7ux8tJSWyPKNri7LohQ9a4KOByKi2uWIeRWmaWUNuJ5yTophuo/wjOosF/Z/x
X-Proofpoint-ORIG-GUID: KIzQF9LmJ8FffLFgD_xnioZ6tUOhLjK1
X-Proofpoint-GUID: KIzQF9LmJ8FffLFgD_xnioZ6tUOhLjK1
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686d38b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4yQetZYTsztc79A-kMQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=984 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080129

On 7/8/25 12:34 PM, Manivannan Sadhasivam wrote:
> On Fri, Jul 04, 2025 at 07:36:09PM GMT, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> There is no need to reinvent the wheel. There are no users yet, and the
>> dt-bindings were never updated to accommodate for this, so fix it while
>> we still easily can.
>>
> 
> What are you fixing here? Please be explicit. "std" region is not at all in the
> device memory map? Or it was present in some earlier ones and removed in the
> final tape out version?
> 
> - Mani

I simply failed to describe the issue.

As of today, the MCQ code refers to the region that our bindings call
"std" by the name "ufs_mem" (which this patch fixes).
Totally same thing in hardware, but it would obviously not work without
DT changes (which would be rightfully rejected as there is no reason to
change the name).

Konrad

