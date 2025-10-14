Return-Path: <linux-arm-msm+bounces-77242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 029F2BDAAB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 18:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE593BD916
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7369E302CB8;
	Tue, 14 Oct 2025 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7XdHwuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C792D30277E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760460059; cv=none; b=HU8qWGG0TOwjdpkjLCjZj+5BXMyfFpnrx2zdURZ3p1n3EdRxdofiuO+mNhgYeHxuCJV3zR4k02Bqe4eLUnPmjW0mA800srxaVJRvg/zm0wD7e/hG4VtfBTXp/dVA4SIYc9j/WHEMQmzWcf7ofGjA52gxY8XHU//gPtTVFJ2vlNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760460059; c=relaxed/simple;
	bh=pEBU1fsxDL1CoklyJU0HIvpHqwCJaja/L5pUvBV510Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kv4aezq932eFTw7R6UHf+5dwuj3qSMdBth02rQ1Pa1Ns+DtLf8Kreg/cczHxRq1Kedrc8PRE+OTl/rheg3FVj0tbFyA01Eet4LTm0DT6+1FbisZGlKrJxS6KRZnCwlCSMvNFFWcFayylhAyWfRYnTlMidnkfARk0Gza5PpBERBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7XdHwuz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFwkiN008581
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0X1wr4PjdOz54wdsgFu8dLkgUPA09PDK9CSgb0qWFI=; b=D7XdHwuzS68pqpMZ
	JzOzK+bJMyzCDMY3CBNEzntm68T55QiLofSuOcOoslL55iw0WQxYs0p5VFQp90Bt
	SW/hLSyF9hWKISWgPHj07KUmFFzlY40m3KPF0J65EMJyQwooScRn6cKQT+MOhVty
	Vk7QmddLqCH1gtOTOrCZzflJcRYgg9Ah5oeggTaNnglNIvL97CycWmpseRdX9KVh
	CxSrzo99hcl1ruGq7chWIvktE0DpOTA4PGMH9UQBWO12WrhzChPDHnc3jfNkQGaJ
	CJOb5Zb+tPK3WIoJVIo9E6G8Xn0ZFFrCXcOUizs2gLTfizHCY5CFbq4s/jhjDlZu
	Y9psoQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt641q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 16:40:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7810912fc31so8614298b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 09:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760460050; x=1761064850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L0X1wr4PjdOz54wdsgFu8dLkgUPA09PDK9CSgb0qWFI=;
        b=Ji5agAXsHeO5jGLZWUpcjj43UewLO5MQYMaYPCO/lFhe5Wod0hXXdWSnCi58SgJRgS
         NFvy8JH6Hch2s7URRlcuiEPdJU4vGY0RsUGFKK7gqA8QXofvps9+kM7+rPiWR76BXx2z
         +obFJNkLWLo0RuWI03oi2/yImvWy/7YOh1rQAxzgcOu+xJnkyNQ41Y/Mx2Cq6OXswxpA
         UTRWtcxPDCcG80fqLNmlhKIuRfrGfmvFYGOrk60D6x117kMTWN6AVBClEnzrzU0e/uNu
         w9qZIdPmyDKlQ4fAswJFv2jaYXQKCVJSp3bz1bdDE8Qtbe9sgyR/fW68m18LrICjKnH7
         j/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZUHxfXBL31xnLzz/cFrwIrHiMYC+PiWBQnZg8TYj6IRc30V8unj/LN3NFfF9nXxHROcU9h/LGN80ZLvXZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9DBg/nDLOY8bI/vSlPNJgjjFurOg8a+M8xWs1iMTjf4xHc7J
	hm30Pd63efOh3u5VqS4VS39V4uq8bk1DjM9b/D3NoKRAWfiV0WalUtu14s65KFWTAxy0QVyZdVo
	ZBAbau6jCPpGqa8RYK/IsENGUur+YHpRZ+xY4T/8qyDQauZQv/aCxP2Ci0W4ZOkYHYW3S
X-Gm-Gg: ASbGncscOVPcFpgG6+6vSm77MnkQ9EXa9fFuyHcp2qzJGfIglWNsxXcl2gxWygM89KR
	nJDfD0qnBCEpZqhbyq2R0N74AXBM+P3MGtjwCl72Q+rXJz3hSEYn+EKuLlVKSLFmuIPzP0U6lkz
	bzvVfzTQCyY4tM+y7N2Ny75cNj4CoborRM04eZCefGymRfgug5XfBjvt7CjiWSsPFbtJBftPwjw
	Hkj0dJfthqbKSLdFC0q7HgMn0vbofDcFbyCWv41FRRIH/EX9u8ORw49TR0aInowJ0X6a3dCvkeK
	AuNC9M1O9F1OGcmpcc+uIsvB2HkOaCmQ8oMys5YCoe1MmpW1FG2CrtrSEAOZnkjPTrc61X3VDO+
	+O/jo3T6b6aah/g==
X-Received: by 2002:a05:6a00:c81:b0:781:c54:4d12 with SMTP id d2e1a72fcca58-79385703dd2mr30866774b3a.13.1760460049717;
        Tue, 14 Oct 2025 09:40:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcyetGzL2Yb4joNdd3PSdMQfwJVPnWXMS4KLKelxJP4P+NUY2iNTrVM8cMUWX9Bru0mzVxBA==
X-Received: by 2002:a05:6a00:c81:b0:781:c54:4d12 with SMTP id d2e1a72fcca58-79385703dd2mr30866725b3a.13.1760460049111;
        Tue, 14 Oct 2025 09:40:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9992ddsm15568576b3a.80.2025.10.14.09.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:40:48 -0700 (PDT)
Message-ID: <a92dd15b-2423-4b08-a08f-757e30cc9ba2@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:40:47 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Support the new READ_DATA implementation
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Carl Vanderlip <quic_carlv@quicinc.com>
References: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007224045.605374-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IotUlyQR9oe_fc4PHecBE8dKU9KN8mf7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX36GdbClo1oYZ
 5f1MBLE3Gqj1xoob7pDx+NTxJ+zUThu4Z4wsNvTo3MHjCJdu4jylkNvju4ILW20datFN44b/rQG
 BaVVYWjpv1jumbWlO4/OajnBm2NgnHJe6RmZ5BGhzk3A1Dz6+5cgaT6Wva1l5oNSzzCtr+Mnpz8
 aV+Yza2/VNDdj3E21CdfleohO9BtE1/eqbekq8klpbkqXLWPXiQVUw0zvT26Jmu8+QEBqxyHP5g
 lQqggPdK1UnBNNGH0fdfa+W9AJyNqUsKl+vlHzCdu9N+vdB+1eDPJvuF2PUlJ4/W0WGob/KzyLD
 YYablDRggFKLSqjP0ZYBCcATxUOHFE/tq0XikoqEe2+s3/joFtAMw+ydSg27MmOGxGiJBZZ6Trg
 LSAnp78rIEkxMPEZHe1wa3ZsHEujdg==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ee7d13 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hMcU9Fbdl6L4-kwaL4sA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IotUlyQR9oe_fc4PHecBE8dKU9KN8mf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/7/2025 4:40 PM, Youssef Samir wrote:
> From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> AIC200 uses the newer "XBL" firmware implementation which changes the
> expectations of how READ_DATA is performed. Larger data requests are
> supported via streaming the data over the transport instead of requiring
> a single transport transfer for everything.
> 
> Co-developed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

