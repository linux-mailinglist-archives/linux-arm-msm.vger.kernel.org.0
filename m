Return-Path: <linux-arm-msm+bounces-75381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A5BA5ED5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 14:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AFC317626F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 12:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5662773CD;
	Sat, 27 Sep 2025 12:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a01VMscc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B8113B280
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 12:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758975795; cv=none; b=agttp7IX9DOsOvAo7cQLII2DAQWdBj4GX6jSg01BRyo5hTuOLrMf1Gc7Yw4juRTKWJy+MaOOO7M9pZE+I6jcI1WQWusrNusNQglAKXflUrnceEzQ7TftEOSC5ed0w5O3V5bIe1QHVZn3xUGZpvUO5lFvbtS93WhIqE5z2hYwgSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758975795; c=relaxed/simple;
	bh=tEQnL8W16BktNpUVtLbw1mUzaFJqK1i2+vMuSRTj+yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqy4NLG6dJm57ZsDBWm9LNwcR7GeqJX29Ua/8ehwTcbwW2tBhdHrgHlyZf40HR1CVHV4yjIECYAvy4a7yky6CodSsVku/AmRmUg0HP4KAdYiIjw8aC+bl48yY4OJvJ6vTDVAc22kfZ6X1yAhShpOJFM9PbPVu+5YJnlYudfUHi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a01VMscc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R4dexR003595
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 12:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEQnL8W16BktNpUVtLbw1mUzaFJqK1i2+vMuSRTj+yk=; b=a01VMscciwbi+pAN
	e77+26oRg33yebQSbhgvPtsfMK/9ydh1rZeoTkyxnUPId7/hDL3F9An29h/Wkra0
	regJvyh9/elDRI7+vKwWFSUVod2jtXuYdqwdzv7OjkTwGUW6NQoLiJt6OQT+OeTG
	X1XZQja+TwfYBWvq7yObz5gxEfkYhAmIFtxWGGT1bJNbLZq11Jgu13Hq4yH2H8HC
	cfYpsclFEEdAZTxiwbWFOLM1e528xAf8Hm/ck4wt7Vjqq0negRqTy0tIIphbTMXS
	KBqhxk2+Ci4KM7p54Rl8DaHKXXlcoKzPuSP9YB8JOGLVVg/evLpkG46UgMeueBpg
	JmP9/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93h8m1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 12:23:13 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-798447d6dd6so8266886d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 05:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975792; x=1759580592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tEQnL8W16BktNpUVtLbw1mUzaFJqK1i2+vMuSRTj+yk=;
        b=LceDmjvz1oGMbkNonLG6FKbweizKgEykUFyojKWIa/SKPcEjIBaZburBKmEi655REE
         IqKkW8XY9xTmQ13z8XfZdFwj/qXpMOVho40oSZ2CigwU4znUTra2kw/RfNbo6MyW+g/g
         Y8ZHoRWVq2vKqucZqP7DUfm0+J5hHFuUKaj3Hl4WARPRpvJtKofxoKzf+yBkARdvgxIq
         OCOR1PYi1gyZgcSQtZsoNZ8mxUJS3vCrEIaOmrVooMbsEIh1Gbeg6H8Fd5fgvi4YI5Iz
         iy1hxNA//Iv1kPDX8ao50PWuNTl8ZjskBe3ihE6TaEVqwELOpX+Sh6c1ay0LsEx0pv9j
         F0Rw==
X-Gm-Message-State: AOJu0Yw/hsIVUUer5/FR+vYNkoW1aDHqs7z0Xex3WQnoIAsaqZVE5NUM
	UOBjTIanKTg9dZXQCgLFXceK1wUrHMeOOMWxzlHHa7FeZBFET4wknlJA3OvOs9HD6gU0HNFxRBS
	u+C1pS8gkb3qD5JrAYJdYXeIudluqxvdHlr9bWezkhuL5amqYV8zbviryIj9cmXBx2+pZ
X-Gm-Gg: ASbGncss99ksKtmETSU8+SOKUGtwg4Q6rS+zDbDGfe7K7pJE9Pt/roQ7tClaLpl3Bwv
	YvRn1m4kVL6H74LV2Tr3opYt8WsFgtoslGb2KbH0G659aWtALZzB+tJfzv9XKJBfohM88tsXe6s
	UrDAO3xtyWX4PkIOd70z0O1j1ukQRbih5U2rQ1HDCQh+eVRGUvWvhdlb4kzjGCbn5avaISLJnOy
	Kg150NCeJC7TbSczTrkEEs2XCgcVYqHXkzN09LCSkTYPfvOLl7WXZo7uSzgeSgtY/g5PLFkXkD5
	/5BUA6ARXS8fh7yv5g897TwYK4PvxnhcA1MWbPmPxE2pTLqxWc6d3PBTcTCHd+WCglaOt0+HWLf
	7PvU3pETxRS+Dulj0NTzW0A==
X-Received: by 2002:a05:6214:4118:b0:734:4ca1:1da3 with SMTP id 6a1803df08f44-7fc45177beamr94137586d6.7.1758975791883;
        Sat, 27 Sep 2025 05:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdOlWd1gQfnVb9WrTWg308MwtnwbvHVNGmojxMzFvYHfgXbWu/S1dqssJ3dgyFbACwHn5Qlg==
X-Received: by 2002:a05:6214:4118:b0:734:4ca1:1da3 with SMTP id 6a1803df08f44-7fc45177beamr94137306d6.7.1758975791388;
        Sat, 27 Sep 2025 05:23:11 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629584sm4335951a12.6.2025.09.27.05.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 05:23:10 -0700 (PDT)
Message-ID: <764bc5f3-4387-4462-87cc-d8787b1be0ce@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 14:23:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-asus-zenbook-a14:
 Enable WiFi, Bluetooth
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com>
 <20250926-zenbook-improvements-v2-3-c0b512ab6b57@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926-zenbook-improvements-v2-3-c0b512ab6b57@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX7sgHd12Qur5B
 wuJNj++p702jKWAdn5igGqKywCcBo6vQ7akkECcBFBDSxbEsQyr2M8jpT2jJXKzSwBQrvA2Qy48
 Zf6ba9OplDwukerQ331/u7MYbAmmo7mfcYE599qt/hRJBaZwuxFyvvxju2Xkrh7v1OKHiQc9O3i
 XXfvS5nEfwmfF3ymtqDTzl2s3OP6/w/EBQ5B3atRQ3SOFLrebjdsXVo9urArwdqFb4EQ5c4SiF6
 nxbsMskVqRvUboaJ8Z7elmIB+zYAChAxWAbkb+bzD/LPjlV4bNcsa50Zd+hTHrl4cCpRvDpzKfZ
 blnaKlXUjUQS30TJJfO2pqFbmR4d+KUvosKDITx+5n8yBBsid5M4K+MvdRNnLTAGleuDFBWctEx
 bhzsKCJ2o9+ifGKySah81Wh0gfvLWA==
X-Proofpoint-GUID: bplwXPXhTdYZAtEHnqDL-5cDMpMBcA_J
X-Proofpoint-ORIG-GUID: bplwXPXhTdYZAtEHnqDL-5cDMpMBcA_J
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68d7d731 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Wopnb8ls170qGKoNrAYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-27_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

On 9/26/25 9:08 AM, Aleksandrs Vinarskis wrote:
> Unlike UX3407QA with ath11k, UX3407RA comes with ath12k. Definitions
> were not added during initial bringup due to lack of hardware to test

ath1xk is the name of the driver, WCNxyzabc123 is the preferred way
to refer to the hw, as that's the actual chip identifier

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

