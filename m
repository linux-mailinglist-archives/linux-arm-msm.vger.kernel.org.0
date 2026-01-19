Return-Path: <linux-arm-msm+bounces-89731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB38D3B495
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73BEF3017029
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2981F31AAB8;
	Mon, 19 Jan 2026 17:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glJKjME7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IiDEpcIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075C2BE7AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842731; cv=none; b=M27Q/CBRYlX6nPZ33J2h5B9QcGzM6Q0DaMgf72OqG99OEv9BG1OpboRfwvPaRp1GUceWaW8YYsIRHKpjYbiqQo6MDxbqkxKC4Lkd50J+8FgejlQYxMQRS/8si6KHRJfKs7nIErRpJ48DcPNxWzbcqfP5w23w9KChZuzcUrxwDwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842731; c=relaxed/simple;
	bh=rcJwkzNdyewx+FVQ3AJEoWO4Micsemcg0w+QV0mV21o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goog6MBTnbPZ4svjH/Af4MIknbA00TSRHOOLXOqwLY0cYDLHaC6D4My7xkqb60TW3+EmWwRkqR/h1DZFkSafQLpe/+ZLuG6lyueDkDxUJS5TOlhBmdsAzsCr6Fln89MWD0AFgmtgwHfQy9uDgaD7uSB9xQZEWWCSKl//5zBJVow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glJKjME7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IiDEpcIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JH1iaf1044261
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3ZsbBKA+dRZT/p5GDI02yQEo
	kHT1R1bEsa+NmtTW5Is=; b=glJKjME74J5wo7nuj0PiVxZMObcfEtwAjdkIEr0+
	WFQNrVSUCT7pUImG41yyLnsZZUXwZGO43p7EBEUY/WZCIhLB+u6rrncLCN4xjSFg
	H65uBU/E1hA2omNNZX/PPoZdla3Z1f6Y4T+/VfGKCKkSUtB8Obu/dFqCCkyjUto5
	o8orl5mjKiodNQCiL91Ir5TyWxaPcXc5cwO2A24SLkaSzxNdgaRh9z/jWMZ2EAWe
	z9rQO+kvvrjuXvbS8o60T8MDgJEcKL0ps6TYfiqTv+FV7WGJFsLRW3M1KHm3Cal/
	5NZGLbNpohWaBm3j+AVt/QTLo//hK8MxVVNkH4fCnAprTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ejw2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:12:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso892676685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768842728; x=1769447528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZsbBKA+dRZT/p5GDI02yQEokHT1R1bEsa+NmtTW5Is=;
        b=IiDEpcIL8xjNopv6TADhm9tVsFcS9WQlH/qcvYEpo4zdBka9nIIHz5l5ArrekuIyrQ
         u0pf+TaN/DUJM4GbDiiKFMIAT+T6JTL1JtaAVx7GmpWI/hKeBN4ownpwiKPXjBx5sHEt
         viKhzxMyFXNCTjaA88OWlUcwvmheJgi1DObTe6hLt/bRDN9m1smrzZ0mblD96X4RV4s2
         pB/mhGtE7YfDD03TTeLr86gbmWMBKz7iYcfZi521gwhfplxnT6zPvpmUceC1jlH0jepw
         CCeCXMmcdf/BbMWuHVvYL6pFpdhGlMVFnU3ap9Eoho/rDPjiW0e/K+l2FlHcF/D48DS+
         +bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768842728; x=1769447528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZsbBKA+dRZT/p5GDI02yQEokHT1R1bEsa+NmtTW5Is=;
        b=QOk3Xg1uNp6lqbrAcUOjFz7jGCv23WVy+XV3kEgPopZt1HDjlzMHyNEgNSRRAp3Wh0
         cYdbgu63ld+Zka2ad6wA0DHJTsbVHhHGriZ67bMTvTpMshFKrVPdRGLLVsvFi8HjB3E6
         HkDgfw4qiJkdQLVMIcKUvjh+zhzd4bQ449Xdsi8wauD5pOomwEcILNw6BrMH8+3N/PoV
         aXMIXgoCXSguvQCgTo6rVU5w755AVGoZc77fAyDRuf3OskARHseaCWJJMsw+FeeygVag
         PLfrJwoqIuW/yhOelqYb/sf+K2bzui6ycV2V1aCWa/IsU31sW7LtcIs+NLu1D6fkQy3n
         N9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVfCk6WxZKFL0mZVsnmHb+Lw4YW+6ugBZ6ewwh5KXQ4OPjLhkQ4wpHfTl4ezJNlAXlT8+SvqFZPx3Ea7oZF@vger.kernel.org
X-Gm-Message-State: AOJu0YwR227brt2UWWw5sZt+U4+Xv2RXZC1hlrlkLX4jzEiBAdDqco7m
	W/TuP7c3DRHBxW4tKRNd75mzqCjpgkHHMq/ACJV7SCNhWBPjCp0igEc2zds+ql3jgR7qt/qKHi7
	uPau3hP/1iPONir4fa8kP4bc+V/98k+8G4DgEnxlhz1V7k/uNxW3l8odD3ToizA5b3uRq
X-Gm-Gg: AY/fxX6hMJhBGr7KIGhK0mTL8R2ja8l4X2flHmlVQiNuIH5KW3StRIqWsv7cKWqm7so
	8jcZzy+m7CYzDThrBIMt5cu4SjFuzLyyI390ufty3dMlwfuSnciEBGOfnC3xaOiizUmko7Uav9Z
	kZtBckuXiuC0UTv4XafkDzamag4xKbTfHkSYR4Jic9ClT/tNJG5ved9XHKZgbDUaeHfggdpoTQL
	wMDOVn9eK69CMg8Z+Zt8lSuVur7wEYkVyzqcejsag6MUeAgsvsmxWMI1Xggb2qCi0zGa0Il0Z7V
	seZwwclQeGfrIhe6VcR09aZqpE9WczUkxnmZi2PlF+advFoQiwdSJ9LaIHJHLRdPS+iP05nGpnr
	q+UKSooVb6CQTTbd22uHsHOhMKjoR1yiFjk0evOW0one+ZuxJhN2cXTG78KjAeKsEopmTaGbsZ4
	2fjqXJ6u92BVI5OaO96j/cJnw=
X-Received: by 2002:a05:620a:1910:b0:8c6:b16c:a56 with SMTP id af79cd13be357-8c6b16c0a7amr1198516285a.38.1768842728011;
        Mon, 19 Jan 2026 09:12:08 -0800 (PST)
X-Received: by 2002:a05:620a:1910:b0:8c6:b16c:a56 with SMTP id af79cd13be357-8c6b16c0a7amr1198510085a.38.1768842727485;
        Mon, 19 Jan 2026 09:12:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8e2a2sm33129311fa.18.2026.01.19.09.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 09:12:06 -0800 (PST)
Date: Mon, 19 Jan 2026 19:12:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/10] arm64: dts: qcom: qcs615-ride: Fix BT RFA
 supply name
Message-ID: <skqdemh2r3mukcwc77qwlosossgyabsnrst4hyc44hbpqschxo@szt7dcefsyuw>
References: <20260119-topic-wcn6855_pmu_dtbdings-v2-0-6d1c75608bbb@oss.qualcomm.com>
 <20260119-topic-wcn6855_pmu_dtbdings-v2-2-6d1c75608bbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-topic-wcn6855_pmu_dtbdings-v2-2-6d1c75608bbb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE0MyBTYWx0ZWRfX0krpmTyry6Lu
 RN3wNYn7ETC4x5d9BwOB/kunzeAarxkRzuFNDNVK8pfNeM3AvZ9Crd54MUUERYs8WzZoalt8k1s
 /svrKuW3xzNpB/K1smo9JwXNcqt0g6PYmsT/fwD9QEEMyXYrGOZNS8TE6XEFrvumzwgSxtBJ5qi
 qmCYnIta/4b0nuAmICoOvvnse4G0gOm61dBbckblIlmwaU/PtUU0QVucadJl75/U79fNxL1YsIZ
 0PiblLBF4SZLrN38hu/OXajqf4fapCKRl7E7ArioH9RkchkGF6l/7mfYBBvyOm8WM+kEe3k5ade
 INzrvL5j6yZP7h+wT5XI2sFNVUkD4FbBaKSuO50zDmUOTJR5OdfqgueDcCO9BwyuXqQc8d0JSq7
 +NXjwVetqKKHxh/Ubrg777lJf38C8Z5Tmk3Bfkgp+hnaf5y/9VnkOc4JjCdJ5AZC4DJ7LRm7vXw
 NxbsuWg2i2Wkk7zVMSw==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e65e9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Nyj594bfyUKc3hNJ69IA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: WyKuzJJRxEynP6cq91DhRJZWnjhuAQTc
X-Proofpoint-GUID: WyKuzJJRxEynP6cq91DhRJZWnjhuAQTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190143

On Mon, Jan 19, 2026 at 12:42:24PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fix up the supply name to align with bindings.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

