Return-Path: <linux-arm-msm+bounces-50893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6654AA5AE38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 00:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B0F33A9865
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 23:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B2E221DA8;
	Mon, 10 Mar 2025 23:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDYofdhW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8268B1DDA09
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 23:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741649870; cv=none; b=qSYcPeNZSKtkruoB9j0b36lbhNFAkKQ8Iea8yJnsqJi3QpBY0jxuyww805ro18cnwtZy+uyqvi7uwvf+jxpDhuAo4iEbTsFied9xF3waiXOaCFRJeOe8S1vw4ntJHK60O0hkGGpsaVAeqvfwkRy3U+MvCJFT8fyaQcNutVn/sz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741649870; c=relaxed/simple;
	bh=+J/gIo4jHxazEkQlxKxKqAY1qd9upi8y4fJP2X2CZWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZurWp9SRLBjW43YwyReerQ/UX+/FBEBBXGOUlbO8S6fU/HiZbxplkyCl95pZ9DC1Lc8dGiPKYScoA4v0GalTObqaVWTjkz+2kphCOBh0YwSY3dykiz8nwmYg/HAfgnvTIvLlhCjP1wVBFxK07vK8Nuuf1wtZcUUYIrb7d+4wx6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDYofdhW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52AK6LsP026525
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 23:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B8TFjGbBf7rY2t4VlMRWb4Z8bam2nqJEippM+OCcgS8=; b=dDYofdhWdXPuo8Gk
	X8eUaoBELPf5r2lDlX2BT9sMdcIDGSW5uKgszDKROEAaiRN32B5gNT5r4XoSNwu0
	CiAXxrBVUk+OwA+0x0mvqy22He+HP+pilje1+focREWPQCX7HoSvVhal/Cq0SGno
	BkPzQKpnwUFPox+PD9jiuJKqfklESge/hfrewZ499QFGDPMzbcBjNbxtCJpkTzSG
	xau+/sWaYf6NZqx0OWLR+5co1SNQQQs2Lo32gAlrpfs3D0ipl6DW7+A8ZoHMEhLY
	JWBMx0XndFszNzskJuP18uir5cSqTEIwgNvr/onXRlcuwy+inZX13S5PzPA29RLY
	rWu26w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f2medbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 23:37:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54be4b03aso47691185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 16:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741649867; x=1742254667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8TFjGbBf7rY2t4VlMRWb4Z8bam2nqJEippM+OCcgS8=;
        b=tyfbr4vTFWT7OLAj0Jf9oibJNnztVrHqyQgLoqTjL0UrrPKVypczWovj1R30qZ43nW
         KD+SpU/6VluSSmv59o9A+VSdIRIYLSm31xQRrPPcAoYZD0huiE9LC7Gi38mEUuf50pIq
         lAXwDdO5Kbs5tI6Cw8QUlurYu4mWl4p4tqDzoFTTYyIaNmXGMU25wgx5zY9EctNNWvyq
         Pv/unIG0d9p6qhUpRWp6OUmIEVjwil4pNW3NpdVdUo8/cCSyQY/yUnRJG5lNHJCH1a7R
         lVuB/KepgqWXlQRlEINwqr2Gp7MpsU3/hAIskXJQf3hs6b7hhgKmzE2DEWFGeajGWasp
         CWVA==
X-Forwarded-Encrypted: i=1; AJvYcCXlFG7yqaawsST/pjuDm4n0UNSbdkgYAaU7DbDGCvPS7hCefEtZ157VyhEJ5CyUXnusHxw+tbE1apflwjZq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwfu2eagLBa0oRUkXUgIBZiFXIBnRlH4t/rS4u6XrucNylIWar
	ZsuwmMMj2ki8//le4Na30bhx/T2f3rutDq+eYFeXPSX2IL5ebZvpIooxJnV14Q7oh4VDCjZ5gMW
	XQNtjnLJcSGDrOA2lB+ox+tynjvO/zns+29QFRwgBwp9E3zn1ZsrIZIAlMnQqtOc5
X-Gm-Gg: ASbGncs3yKlaErU/dcZJGWac67vNf/WIWypBZT+BOMLYsusk64Zwo8w2RNpnDRk57jG
	14JEVHqiHRJg/FlPdCTRQIigRgQO3bqlLeKBIpa9IQdsRQyvBebjQef1cCzoFs6p5s0hjTpWteL
	oAFOeNo9B9Ux52+8sSEoFg+VklxqSiISOKsWJCmf+GOawyLmm8eNHI/gfU/k0+lzMYWlQi+LaT2
	31BICxLThZDCft+ndLN4/+jPcFMp879rPlu9aqpXbSxju1qFXxeS7tUN5TGwmy0gU7S5ysWUt7U
	iHh73jdX2C7TGRxCEEYvKycN9FX9sFaJXYvm1zenPJ7YbG5LtBDgg+ivppsoxsBebLsonA==
X-Received: by 2002:a05:620a:2603:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c53e1d8eacmr535686985a.11.1741649867234;
        Mon, 10 Mar 2025 16:37:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4Mp5wCFYiwFx0JJwA59DroSlD0bMK7BsJYztTlXkZgV5YDKGVGzmedYfg/iXl/C3zcTEbzg==
X-Received: by 2002:a05:620a:2603:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c53e1d8eacmr535685185a.11.1741649866890;
        Mon, 10 Mar 2025 16:37:46 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c766a194sm7397206a12.59.2025.03.10.16.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 16:37:45 -0700 (PDT)
Message-ID: <455b685e-0ccc-4c57-a60f-39ff9cd280ca@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 00:37:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm6125: Initial support for
 xiaomi-ginkgo
To: Gabriel Gonzales <semfault@disroot.org>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        gpiccoli@igalia.com, kees@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, tony.luck@intel.com
References: <0bcdb8f9-9a3b-4d6b-bf7e-55a22ffc5df9@oss.qualcomm.com>
 <69f26012-e71b-438f-ac58-e0a3faaf4d43@disroot.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <69f26012-e71b-438f-ac58-e0a3faaf4d43@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lriji3-1duT8tHYTQ2AYKKpVIjDawxM2
X-Proofpoint-ORIG-GUID: lriji3-1duT8tHYTQ2AYKKpVIjDawxM2
X-Authority-Analysis: v=2.4 cv=ab+bnQot c=1 sm=1 tr=0 ts=67cf77cc cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=FfWvQauag8hAH5SirX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=970 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100179

On 3/11/25 12:28 AM, Gabriel Gonzales wrote:
> On 3/8/25 23:11, Konrad Dybcio wrote:
> 
>> > +&hsusb_phy1 {
>> > +    vdd-supply = <&vreg_l7a>;
>> > +    vdda-pll-supply = <&vreg_l10a>;
>> > +    vdda-phy-dpdm-supply = <&vreg_l15a>;
>>> +    status = "okay";
>> Please add a before 'status', file-wide
> 
> 'a-status'?

A newline.. the brain didn't synchronize with the hands

> 
> [...]
> 
>> > +&tlmm {
>> > +    gpio-reserved-ranges = <22 2>, <28 6>;
> 
>> Would you happen to know what's on the other end of these?
> 
> Unfortunately, no.

Usually it's some secure i2c connection and pins for the SPI host
that the fingerprint reader sits on

Konrad

