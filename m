Return-Path: <linux-arm-msm+bounces-97004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yICFO+dwsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:40:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B732264B69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFDDA30182BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA6030E835;
	Wed, 11 Mar 2026 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bK+PGpr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bi3a7QBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92A31ED7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236200; cv=none; b=umBcbAbnWXZqGAOzGvfPb2GGki1tiXIrNrrR4kMyYquhOKZ+AKYulG7PLYNdWD1gxIw8n/e2Bryh8z47zKwBOyCcfVoS+0CgiKxZkw/Txj6SRPSyHxOlhGg1lJOctFcMiw/6x6e82GcfcouQLXciVzR7+ygOY5NAxyJ3BxbHNSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236200; c=relaxed/simple;
	bh=IL5+CLEp0JTXBwWQDuoOZRJTYGpyVj8TwdziVEK6VzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxF1C0b7dIkrezGpLPwsNb8MOeEW0IsKQS+TlOonOfN4hycd7bVcQjGgptFjfVCdsJtmURosFSX+sipZa1ynnD9n4ynY1KKp+Yd9TDd7j5XJCWYLQ0jvsB8lJ0gOh72e4UbPoQXZ8bn+yrhfwwG0Dzcf/4wwNNTMp+qDArHUEF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bK+PGpr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bi3a7QBW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCM5qJ1439671
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGqJp1HesjofSgFAEM+eYixHKEeYxMvdRZNezmTz1AY=; b=bK+PGpr/DQYgNlH/
	uTlQyduliYkNNp558wd0ZgwtaxSUByGiX+R+uGwV7yQB2mP2MgatumCUtj7dHdBw
	Pwn5A8/EI/5o/H0DK3+ZtpW5W+J5UljzxX62aWsV75yhNX3Ma7ATw74wz5BRnzo3
	frcv9kDkWIJWDJUlvvUPHR9YC9gF6QOivZ1OiyvtiBDoZGr3YPnmpz+y55WFEiHt
	rDmikLTbclnm+44WhNGYXoSTi5x6JA4qNVi2pYC5ZQ4I3WENAVqLCrr0bhBp4lzu
	EI7xGBij09WXnUEK73joatb7DbjC97blqyK8a0EF/POuMU9vfYfmSScRAPy15Umf
	XI2OYQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yhgu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:36:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd93c91075so137454185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773236196; x=1773840996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGqJp1HesjofSgFAEM+eYixHKEeYxMvdRZNezmTz1AY=;
        b=bi3a7QBW/fh4IY1CAHsc+MTtGtSTd98Zn4SqJuO4FCjnkea7LYdGCsDpAileK3GV1X
         764o8YAxiVSVQkl4DhYp/BMioks3+rLCOfIQlQqwYMHLIwILnMbiqQCWyHP/4uUIOIeF
         KyLMegLQCCiQQfzcmiChO3KNShrP0KK04Dvpwd42wknnOx2pjS9NPJ+QAjOiLTNskZBy
         ZbImGcwU/1M4N+ATADALMgt1cJT+LqdY20Vx8T0+50qGg/uu3uhBEUvc2FRiujWb3yEd
         aO1SQfIVsOhwNu1VaqMrjTRIDJmmOFa8BOHyN2CGV6odJP8/fNFbv1BIhpxJWQcJAHKu
         Ggcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236196; x=1773840996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGqJp1HesjofSgFAEM+eYixHKEeYxMvdRZNezmTz1AY=;
        b=VB9jnilnLrHgd8Q3qmW80iNqI3zDz7cUsBBix3tLmYa5vkRb9/MEhxCJE2CiMVf7FO
         Vf7I42URQL9TrOwO2VIcVeRHqNN3aKfYz/O+Vu3Vm7gwagGFC3YYt00XB655zDGvnTko
         9jmmclrvwr2NX0aTJPpGTfJz43nvPmIhRV6Zce+DFFf2MngKRhFxernLLTtNZy3P53fO
         u17Tgj0fYoI58vZSs4Vul/yzx7gZSvDmG2vTMhNTX98iLk+bmc0OaQEeeB8BZfilGvkB
         mKut7NZGyERFTlR13y0ZVC+qPR50BS9fGObifcuhwAekJ6g17jn9KHrst/qEWYpy8Yqw
         zt7A==
X-Forwarded-Encrypted: i=1; AJvYcCVbxbAr5Ym6RzmUM8tpSGssdNX4e+n1vA9Il68P4ik0OfpQxHiSrbn5x3QeNTLDMUbV2LIB4QgmgvKK2Y9p@vger.kernel.org
X-Gm-Message-State: AOJu0YxGFkshLkRGfjBLXhmo5Vm6xbM3OtEcI/UCDBAO3DLIRS8sfPjs
	+yOiv7uV5TIKlgUJ866qZ8pYS9w5tX6qzYbw4YhTIMWEP0tWpDPam61Z6g1xgCVd9+RWa50J9ae
	kn5MCbjO2bkzMqH93R56Y9N2X/d/3w249UK+Nf0mdkYvv8yLHjBKCrrXuuCEHrqsQXHCB
X-Gm-Gg: ATEYQzzRFJWNIlgaIkvMGgGtZvAaQ06Wpgjs59XdMjiDG/N/+gkSBtXwivolsKQCmvw
	9Fqdw69IpulDPNS1lYrmgBsoEhPSzDX48i409QrJC/EYhlS0yoXlHrlgtVdItt+HoBA7t6QQuR8
	JcyK/3hOIzpLgKOKyxninyjeVii3cij5O2XZAHHNS7uiEMAPYX8huYgcmJdKIyDMBDb+6PAZ6V3
	lL5+Yr2Xt6rN0e4iDzH4GXHL5Y1WfkA6rXSAM6hg9X3MUBqTXbb9nlCbK7OUIcrvJBcGaqSIB5D
	8FnM4NdbtZFsQY4HFJuGr3gJQb5ZTtzCZjke5ZZrJ+u9tbVR6H0BfW9Lb5qwlgankpPi2u+JDh8
	9cJM+EE4/6O3O9Li/nGpUrO2/PQ8vF7j8hIFfuSJPHHudqve99f6OsopqD8Cam03j4lITcpMfpn
	IDrgU=
X-Received: by 2002:a05:620a:1720:b0:8cd:7fac:a2a6 with SMTP id af79cd13be357-8cda1865d9dmr251601585a.0.1773236196485;
        Wed, 11 Mar 2026 06:36:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1720:b0:8cd:7fac:a2a6 with SMTP id af79cd13be357-8cda1865d9dmr251597285a.0.1773236195987;
        Wed, 11 Mar 2026 06:36:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de092dcsm56411066b.4.2026.03.11.06.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:36:34 -0700 (PDT)
Message-ID: <4e98781d-9382-41f9-98b2-2c5a25c1bf06@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <20260227061544.1785978-14-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227061544.1785978-14-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfXzB8DbLWde/SA
 OeUVgtbOqxRvbUvNk3B7TVOVBolSPtw6oYTcCSxoj3je/G3jbA9GN6SVlj22nt7061s1SczI1U0
 Xkhul7sbjovwEUIzq6UxjyVp4Rf0NYYzrIaty6ataYFBqOhWUj3hb9IVXzgTvbxB1jEFlf9YUsz
 iKQwbpGHqaUGgDpwL3SKGHvmfYMbaZg2wjJbFp/iqmczGpjjif/EZqWoTmAbyRNa//mgSWkooML
 lbs6005/bjBJpywIPw1VWE5d9Ke2hg94KhB356MB2l/6Z9IpwyUFPtaPm3hUvqb0XmjAsyK9x8o
 XB+LKosJqs8GQjB2yC/X/sGT7C8I5b7A5mVtlKyZv2WUzRqpWYDVsbuPNdYuPrzK8Cxm2Dgbx4n
 T9pBBeArBRwPkOJREuyXiThXTy9OvV8QOuaW1YEIpzvJPvGv8inS9EKcTYhJ4+UsWCf3UjvwHbQ
 VbZmcOS3gx9TV22YypA==
X-Proofpoint-GUID: WJP1Yc4auEDXt1mvR014KNlkcEyLQ7F1
X-Proofpoint-ORIG-GUID: WJP1Yc4auEDXt1mvR014KNlkcEyLQ7F1
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b16fe5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wYGpMCW26V-xmeov4-8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110114
X-Rspamd-Queue-Id: 8B732264B69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-97004-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/27/26 7:15 AM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM.
> The driver requests resources operations over SCMI using power
> and performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power on/off.
> 
> The SCMI performance protocol manages I2C frequency, with each
> frequency rate represented by a performance level. The driver uses
> geni_se_set_perf_opp() API to request the desired frequency rate..
> 
> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
> is obtained using dev_pm_opp_find_freq_floor() and the performance
> level is set using dev_pm_opp_set_opp().
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

