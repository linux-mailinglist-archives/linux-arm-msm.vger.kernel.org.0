Return-Path: <linux-arm-msm+bounces-82468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D8179C6DB02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 4E94D2DEDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ECD3396F8;
	Wed, 19 Nov 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOA32La7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3HetOl7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C8E3358A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763544137; cv=none; b=E9Sa39tbVpzipWkbCV3c/x+TZDK/MCSNSZVKz3KwnqUuGo05NVDjWAqa+RHBVHRbGxN8ALeKJAZAF+r4MLm9clkodiJ5X4XxeKc6cgiAjIivzpPPRNp6SEfkSYsQY90d5VfD9qrGcBZcO+Il7A8YB0ii3D72blodlvETzFGWR1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763544137; c=relaxed/simple;
	bh=lADHfqpowyyKvEv6P/mixvEFhLAPoqY2zbgoMB9bccg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pn8/qPNTpKYdbyH5stybDsZj96qCcTzEwGjbwCvUV2bGqz+8bjeCiPTXSxmQSQzXaaLUVuyDIeLZeF8I3v9SOhoNtYeqsFku4vm0nvf2kfTHmj2B/UuyCu3oHBIiJj4N7f6bGIr53YmRwWNUzBe8b+z9vzfW8dEjL0Uhjca/+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOA32La7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3HetOl7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ5R46q2926737
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5f+J0fD85sWk8MU0RliMNAOW/+gcld35mbmvM5bB2Go=; b=OOA32La7iBDQsmxD
	JhwmuZMgTjGBCWV6AVMq52GNe5bVEHyz9kWcG98cmxfUYl7XIqmFYGJ4Jd+CkU/Y
	9SMzYYFMcKonJlq8hOvIicfwGdx7tgsd3132NA8bjrbaVLlPL0AxCM4HDgE5woCT
	xC7dq7zPet8BVWju1u3iQjvB9/wfwupdUDqRPitsAyUgP/xEybkeBCLOxunf2B5h
	uczAJbEjjEIoX8XdCJznkryojwXRGCwPNo6iUFjapI02duNm0+aDPECYrZNqORh0
	tLntqIR2+EOLVnGNFUV3w8ExPnzXrdx8BKuno338cK5W8pommSdDbBMm7D1fS77l
	kGRFfA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq293nrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:22:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0488e746so15298091cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763544134; x=1764148934; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5f+J0fD85sWk8MU0RliMNAOW/+gcld35mbmvM5bB2Go=;
        b=K3HetOl7K5kZ46TtOps0ym5KQVLSsQYviC+9g2hYB+CAgy469g1jvQDzILEtylpR3n
         37xBXSB3uTJe5xkniz7cFzxJAcOg9zUYZwZeyxlGrYZRnvTOm8aroYBLPtNAUHhwhwXu
         1G8E2y6RBXSfN4sszmaHAQiCjvKRtbGISdZmmJvX5kuzwjTI+EvEYFOgg3Lcf57EKbOr
         Y9wNlP+6+9n6m3OzUQKxwOllcOSqhRtXbDxDOqh3Xf+RoeUso1q5VzvzKECkqF8O2FVl
         gCRBH/MAPNZP3byBbsM5SxE2JvH5Z/ITy69oAjJ3aFZVnBLJvgIzFcuuMmlB7WHmqOtj
         sWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763544134; x=1764148934;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5f+J0fD85sWk8MU0RliMNAOW/+gcld35mbmvM5bB2Go=;
        b=CEi2RjHm3/OhPVGH24euNzul508v/wQd83xVoVpwjLBqKAGG9ua+a8/REBNUtGTM5R
         qSYxANDnP/JgnGg5jF+pOCtIAoHcWCNjk/PcZGz9IFets5o9Ia3oOz0P2IlWRnnlyyYh
         NyVjkICVB8ZOvLdtsbBzJQQ6hVBwkRpMC5m/9nSD/LpAR2rwoCRb5tBmSUmd2bn2D1x2
         2PyPSX1IpyjeBPUAj9mi2hLVNp++ef5/F5kl0Z4B8wsr5AM/yWxzjdkNdJKFleF8Tv/P
         IqD/pUr7OJ4E7DViDkHlxdP1DiVC0esE67lTBl/UN8xh/5DnC7MJrJWTgPt+uHrD/Y9b
         ZuOA==
X-Forwarded-Encrypted: i=1; AJvYcCWWoCDU0SsojV+d8t52tt0idLLbYxU8A9Y0gx8h3UhDlEcak5Wx6+bHOxArpuaeLrpEPlc5dgOCzW87IbVH@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGQeQ9Hs6mXvuJXkc4sYhxSZ3crr22OQRij4mETAKjrX6UPPB
	QObj4GlfDrGeL4+8pFFkdtVbFz6/OSNBkMsoiKEF/1I+Mf0jPZmDxmjcgL5LIZFOk0tzTeiXj6z
	jtqBWxGM+0O94qBOXhsuU22mXU/UEUgNzaD42QN/fPuFy3QIq2c2ZEow0bgKI1IdTmpWm
X-Gm-Gg: ASbGncscpTLFfnfautdp6O80mitMNsBAEI+rcNAkFYuzHwOx+y3ijD/tWFMQYDD9KYm
	X+e5+CsxLWHZpaJTCAhvV+uQjVrpHaHc2x/zjVjARaMFDj7iytYjIREnPyygrpW6sUKYz5rjxMt
	pY9tKHNlXxYJsDrz0e6jcq6bH0ndDyef7Y+SsS7BTMNFiouAo3p1cUn9dDe7u5CbRej1a0J/MkV
	hUTwHZyPEhDsc2+9kV9dUa/HYp6wC8LKf7vB3pu1Pt7i826jPXE9E3uX7c3CZZfVIiflzOHWeuo
	9OpqPkMrGj5rx2tMeCp0eT9+zhe8zvbwAK1UjMXLHYMBt/lBvW34GLS3w82Ra8KVdzbVsewY1QN
	sm8ZAGUgWFdZXoDmyQm2jlmbrxWStuk9kQKJ2LwxKTJcCqZfAqOybA8oKa8HC+iJXPNlKfORZFP
	NfSKlv04I2gnXPtgXwv0V7rtI=
X-Received: by 2002:ac8:7f0d:0:b0:4ee:27a9:958d with SMTP id d75a77b69052e-4ee3fdf901cmr21432311cf.16.1763544133876;
        Wed, 19 Nov 2025 01:22:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZYsTdzI0vo18xePQ7Wn/lJyBt7LqS1yTpBmbK6Nd1hAspec4tyGec1K+AGljwAYmnnQ+ojg==
X-Received: by 2002:ac8:7f0d:0:b0:4ee:27a9:958d with SMTP id d75a77b69052e-4ee3fdf901cmr21432051cf.16.1763544133391;
        Wed, 19 Nov 2025 01:22:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5959b43420esm867907e87.65.2025.11.19.01.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:22:12 -0800 (PST)
Date: Wed, 19 Nov 2025 11:22:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Cc: Trilok Soni <trilok.soni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org, linux@roeck-us.net,
        Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        farouk.bouabid@cherry.de, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, m.facchin@arduino.cc,
        Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Arduino name
Message-ID: <syvywx7pph3fnoayaghxzyufl66xueoi3tw3i4wdaq2cpjhe32@vbmdjywlasnl>
References: <20251114121853.16472-1-r.mereu@arduino.cc>
 <20251114121853.16472-2-r.mereu@arduino.cc>
 <5c30421e-108a-41de-81c7-c0c5e5290cc1@oss.qualcomm.com>
 <CAKA1JhYgUUSQxcvmJPdeLu8S_tO5HUOb2GAhS_zX6jUOQzfm1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKA1JhYgUUSQxcvmJPdeLu8S_tO5HUOb2GAhS_zX6jUOQzfm1Q@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691d8c46 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ar_5JxPjAAAA:8 a=EUspDBNiAAAA:8 a=Dh_I03XhuwJppenT9bIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: uSLD3FXm17JKMBnvAhLMhGFcP1YuGZGH
X-Proofpoint-GUID: uSLD3FXm17JKMBnvAhLMhGFcP1YuGZGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3MyBTYWx0ZWRfX6X2chazhdFg/
 fUqOhKAN9+fPgTR/Dq3A9bjVlVxtwYXSoJv1S+WT+5Xj3j2nQW7kdKVC7e7Q32S2CvozbGsBFew
 NJxl/dZ5XqBTTauo/VBJs1gNDRZHc3NxIyNjmX52LEtyNGM0AADBvnOpz34FHiHp6HWbXh2nwly
 kntE43awQCI0lZObicjTvww1Lve3n//fPSdZ4t0BMbxgfnfk0jgXSR6bDN4/bZ9E9RU3+Qp0dVI
 zsJukBitrlOHnYZrmETvfH/QfTO8q3YyPbhD58bLjxIPNWhw9zbfWeCj7mRXNy+/KGc/psqPwof
 fuCmfXMnmO9916aZTJbZnNfB20W5EDpJyQk2/1rAn6v0kcYdnZPND5iBmM6wY+AvGA17K3BMPDl
 y4vOJo03JhSozMQe86gQXJv6pUfYuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190073

On Wed, Nov 19, 2025 at 10:11:06AM +0100, Riccardo Mereu Linux Kernel wrote:
> Srl (or SRL) is the equivalent of LLC, SPA (or Spa) is the equivalent of Inc.
> Just noticed I was inconsistent with upper case and lower case letters
> between commit message and commit content.

Should it be S.r.l.?

> Do you want me to fix this in v3?

Yes, please. You need to send v3 anyway to fix From vs SoB story.

> 
> On Wed, Nov 19, 2025 at 5:49 AM Trilok Soni
> <trilok.soni@oss.qualcomm.com> wrote:
> >
> > On 11/14/2025 4:18 AM, Riccardo Mereu wrote:
> > > Add entry for Arduino Srl (https://arduino.cc)
> >
> > Is Srl or SRL = Inc or LLC?
> >
> > >
> > > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index 42d2bc0ce027..07a285c9387e 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -158,6 +158,8 @@ patternProperties:
> > >      description: Arctic Sand
> > >    "^arcx,.*":
> > >      description: arcx Inc. / Archronix Inc.
> > > +  "^arduino,.*":
> > > +    description: Arduino SRL
> > >    "^argon40,.*":
> > >      description: Argon 40 Technologies Limited
> > >    "^ariaboard,.*":
> >

-- 
With best wishes
Dmitry

