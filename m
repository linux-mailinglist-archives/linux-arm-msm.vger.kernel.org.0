Return-Path: <linux-arm-msm+bounces-76475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 37606BC64B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E3884E163B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBA72980A8;
	Wed,  8 Oct 2025 18:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCWKhX5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F83244686
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948274; cv=none; b=J6KXUpU3310eQjZGdY1VwrTZ52BH6hxCKrREwe79GToOVGTQo4o/DBzrAVb+svjWkI77XIKOCWE8RBQBgFRDY3Nvk67dONi7gDXkb/4+RZGTjWr/9WdIGSAocbdpbdjvB4VBEy/s/Qio3k/NW7Roa0KMU2bNhDImwLwPRzfeJFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948274; c=relaxed/simple;
	bh=BV+z4P9e5lYBnNvqVSMoJNv5m0JoAv7MlyozELZJ3Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWUYe+A92EmnlYeMgyaWQSWSuq+iMJOwmwew6CJvrJls3Jtk1AXgORbXkyGqJmh0+zhbeu9L06W4AkOQ2G1YmFo1Q2wjlK/tCN/xwLoA9/nb/v+Onxziq6ZHg5K+xg345T5wR4KjWe5F76fRvyl0Lc6AokzIbCWAQqOeOt/Ij0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCWKhX5G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5MXF003100
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZFnid2NNCpzG+TgYcmVtCa2XwePcFl64IYZ/RFi01M=; b=OCWKhX5Gs5zUwGPK
	kKlBqCkYabCp4qJ+2Wx74yEYslR95d+9GjpWyg/Pig/EX5I7fE0VUf0ZJZ9rIuDu
	MYlFaWKou0tAC9Sclxq1FcYIer9173au0W04HmY5jnVqZ/gslkvlYJD4I0yn+l6T
	qggL8KFRvNI5cYFCqeFBjoaEvsKYeO/c3Ymj7pl9lP9qJWZPyR0PLtLCDVYvYaft
	rByCrlWSSjJsJjfI6Z3MpU8paLoNQrZbWNj6ky2wsQ0oMgOCnS7vI5oVH5QptajW
	CD0goZFvunClHwznGHH+NMKmoYhUwds+jjFzDGDikBBQFiXPbMaXhgKoCnYwiK6q
	oc9B5A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m086y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:31:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so378698a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759948270; x=1760553070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZFnid2NNCpzG+TgYcmVtCa2XwePcFl64IYZ/RFi01M=;
        b=rgChhcG8Fc6CE53FT7VWTs4loy9Yx6WSLfKtvxNJgBaBkVx/G/xpyO0xNcEyWWsOTa
         W7fEBISWWSOaNg13KgVHVjwhQ50PB/YJXVHVl3lV4WoetnKdITykFxTqLsT1xBCUWEGl
         T1vJTU+4GlhThyyuC9wO+aKuPX1WQi8WkrldMyimyC3zzHxVVKOpNI8pRFqTTjdWBRaJ
         t5s+KMqI1FHVux7Xj2yFMwom1Z4YIlAV2jpFNQ3BOfj++xNyG5+/juLebu/2+aqAR2mD
         /A1/llk/Djv7nEpAaJdcFbbtp/K9NlFQhe+TyIbfUOnqVNuz4W0v5c/Pp23kR+4J9y42
         XYXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJI1vUpzBR4Wt/rFoLNPkgvDqUjHmuKNqlK068/3agr4aAqJMug699WbzNiZocyhlVhN+LQN7EjmkxG82P@vger.kernel.org
X-Gm-Message-State: AOJu0YzRk0LamLoTUmRo6voHDzOFgESzDTO+SIGphpJCe9P7a1aeyxj5
	prnTGzz+XfhN4oho2xrYz6OEIIg9u7ok1RErzmjRpBIulXIVZyRaS4hgC9NIeeQR2iGMuWnu09I
	P40jD32ynXkZMv2JnX2wdZtImgaOxbDRsTgEQjptG15sXpuRYTJ0xXHbHaQnnLnDh6Tnd
X-Gm-Gg: ASbGncvJYAP6XTh4F1bEVHvBwAtuyByR8EgbDAWEOkAn5SZGnUXMPMkrRXgJ1NF3V4F
	m91wdaIaqGv/766gXoKCA092zER7II4slUEteR5xiLtz5EvildH4EdYM7r337mA9dPGYkXT7fSD
	yN2Smkw8K+a5sll2i8QxoPkR20RzPfCVN4Bfn2UfYIOvrWPUpQDASVQgs1QEtM4vnJO++Live1k
	m0zPNDGcUQQdn9ioNHCewg9e4TSE0uhPPPJg4hTOCj2b2+NaxZCd1/l2otiZCBugZTXIVAC7kiz
	XCDIjyLm9p78FrmrVJ3dA7OWGVU3XxeTyD+aAG0/cnvJZ4KMfJ0qJ5f33m/UCAfAJlV4iVuX4yK
	wcVDcfcZMtyBnl/qp6nE=
X-Received: by 2002:a17:90b:1e07:b0:339:f09b:d372 with SMTP id 98e67ed59e1d1-33b513b4c91mr6216073a91.23.1759948270252;
        Wed, 08 Oct 2025 11:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAtXHorjUAFWBrcoGrQwXv8AqMgJyr95gtEozvXIgm/hpMgEEegnykZ2c+L+5g4zxn2u4SrQ==
X-Received: by 2002:a17:90b:1e07:b0:339:f09b:d372 with SMTP id 98e67ed59e1d1-33b513b4c91mr6216013a91.23.1759948269735;
        Wed, 08 Oct 2025 11:31:09 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b52968581sm1407281a91.4.2025.10.08.11.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 11:31:09 -0700 (PDT)
Message-ID: <a50612e7-c2c9-4b5a-b646-4bcf32a67aac@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:31:07 -0600
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0NtFUwxngNDG
 T8gsYcRf5tMsDdqAwNwnSSevf3/FPvT4bHza/aN29b+NiDR13o7E/e1GqHFrmKzLG8T3vtxmRay
 T7oQKYbq+nRj6KoOckiGds32SOVYfmk4UtMiVYyoFmYgwtk2kVQt2xvInnEow3dN71Hzesmw8aK
 lVzSWG+PsNHkowTMsrPWbuKCm0UY7PdKCJgIuSnV89HaIrf4gN90GRMyYR5x9LhlU11KFVyBqYI
 SF+0GPWEP7ryia/itpmDww0IzZ7nuV5MIgM23hklltFpzlfinj2bnKOu9wivWggHQHqu3DOXxGx
 /soUwGWN4qj7/hR/0aA+DIdH/x8kY2V4f9ltqzDYMJVAXlZU0f3QtkJTUPxS7PI5cjr4/gefVeS
 +r+Yty4fiZHQELU2BBqLma4zcHsb4Q==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e6adef cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=hMcU9Fbdl6L4-kwaL4sA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WLmsorB2SkMk5nbecVDxU-BFZqf8r2aK
X-Proofpoint-ORIG-GUID: WLmsorB2SkMk5nbecVDxU-BFZqf8r2aK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

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

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

