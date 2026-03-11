Return-Path: <linux-arm-msm+bounces-96910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAanJHQxsWm0rwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:10:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F662600B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13E2630B615B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4AB3B8BD1;
	Wed, 11 Mar 2026 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0Rl+f+9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q7K4UOqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8473C0619
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219397; cv=none; b=VPz1rv2iF93R8w/+b61Ct9FJkqF1/QwbXk7RfYG2xqssHhyDM5grnbxqp3EuTkTZRKg7bf7G+WRCtqfbyUgGUoiBQyoq+ql/RpXu/KqxEhr/9v1boFMuxNypy+/OF98qGlRp5b7mUo9CD8GVlNalJ9NQofvSzBFgXuICL4zpOeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219397; c=relaxed/simple;
	bh=GxhyEOLS942YERY522cw1a/tosTCri9aYho+t2RDWNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JN1iJE0o+YWtxGRKDsnZ95U2C/cTdpt8HoghpWfs4FY2iQZq+n6w6vplWC8QQ30LirXL/+3/CUzOGts4FLfsiLFTyx7oMf6BY9wbAy2xvlC5mrU5AdN5I4YHHOBVLO27RzJSgPe7pOYFuFT1UMTN96kAxw2Q34t55RbLygKn7TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0Rl+f+9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q7K4UOqa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3ZDjF3893450
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pl93YixHoiXJRlfs0OC+xUhIllfIU75ORxITZTmWc/M=; b=S0Rl+f+9vCPnI9qC
	eEiaMpLDIEFN8aD6LBP9VEQlHz6L/ndG+TSVH4vBerkVjELtft+mc0evvM4omCsp
	/61XbzfWagl2khT3UXmTaVSkIyZ/f01Z4HXeKKrx4JikSxeWWwOFnSxcoJZ65XFT
	5SEEpMIcbgoim0sQI/ENbVbzWxxIBMz9sgZJa+WnambHBx3XuA44nOgzx/PZ1Arr
	JRPz/T8/eBP1hwHdgainqlJZORL7OmC1tc6HGSafgV4uxV6VPcdbm5jbTGmetkRA
	pP4G4lRDQPwjy/PxBBTzk+ESI4OnkmqOwAjvctsoKDrHIUDdiMaHRGL6HkVB+sqO
	9b7rOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyux08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:56:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7381a9a932so3820297a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773219393; x=1773824193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pl93YixHoiXJRlfs0OC+xUhIllfIU75ORxITZTmWc/M=;
        b=Q7K4UOqaYY5lQ3u0i7V0aDfqilXwd5HNDgDXF1oxUG+hBHu9nTIomVp130082uyhRI
         xgvxBr4ryzHMDWWSZ8gR8LfubQmyyi6GdrvxDzIFHBPJBItceiL4jqy/rzcd5/LT64SD
         W89Sn4L7/6s0Zany3ZEPWLqwg0E3b3Mb5S03RTC6IcvxZl4bp3odY2/OfCHPHsFhTuyD
         4KMG4lr9qaViF1fIz0Sk5cyNduXlrhbOH0VHe/IeR0oPgAqzVu54RGOtubxmSnL5R6w8
         N0tHMRuIJz6k/t3yLLb/Ra4uhcUtMo88ZR9EcFWJfW92HcUIQZsc9/jsdQyMVUWQwMW3
         CmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773219393; x=1773824193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pl93YixHoiXJRlfs0OC+xUhIllfIU75ORxITZTmWc/M=;
        b=qvb18h69uqTCJK3rR7kIcoug4vBM08lg7Jv+/qQ6w9ac5Uu0AriQLEQfcsCvTSagpS
         oWTCV9VhrTvbPuSF93TdiJpLQ3dj83duBisG0YyCUZVaDTwHz9AApyqesBS+4T4W4LaQ
         B4j9VV4hH4e+QMogJEcfVyxMORy9UYpavyjqnd+TjVzx+fXmreS40a1huvLyWdoCyW8h
         XTnnQ2XIcpwkEMAbJiHM3EVUvX3KFh8+66zI7haOr/ctheioNfWYdqMVh40KyjiEDgRJ
         +TrGs7t7ssoZ85C6a77MWpePpF6RQbVkSeqTfPK2Jwvuu6UT8LGXngFeAQSCUtH5ubmm
         2sKg==
X-Forwarded-Encrypted: i=1; AJvYcCWhcbWqW7p24ZrjrOoOEM9D05Wpd9eykr+MZztmoV+m8ICXZ3DZx5bCP3AJlPN28XWkFEr4H7rYYZkT5892@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ayNIpCMGR3c7/ew0CU9P6FiKJUu/9o0p9I0DSmvpXOz0XZEQ
	eHJ1x/0jvpPyTdPAF/KpaVZQFZPOs+iZSzG9ME5t6jonKWewEuIMmLyIHe/5AcY9Nt9UbcE1mtm
	wifjjfExuTF7LITnKXSiEzmr2ray8rfE7afKcxTbsfmjGRKuw9VIfWCDgYZEtpBPM8sW7
X-Gm-Gg: ATEYQzyvGlZcXQpW2MWKQzQnr2pzdpPcE0VqjtFIwYEvYc7Wg9zU9b/1HeApjRF/3PX
	BkSx4mbiWnP0npzsP3cxjZ2BOndMFkFMJEKW6fT8ARN1AzFulMZNUUWbfsaHDNDkoKPaTit0A0v
	m8gGxSoYlEdRF+pF9TNsvLUio3TYuJCLfHvIIcht6q1jCmgMIDseNtQUfsnowC+fB1QNx6G/lT1
	bIl2eLYzDuBZreChT0pJ1ctMsq3pNqyj1I52ygY/UqpO7FgpWP6mwQjxKpw/uGn9Mf/xO8yJq0p
	OtkdMvhHYWJUjeyt7LN4MYNeaIPcPDsYEUqkWAkCdqJbTyUjdVAn13PYbaEUozVssE7lquoSqh5
	KZg9rbfvbUzGuQr4iTD3aTfqZa0rD0QGhyK1rJ0vsNc+z1A/Q82k=
X-Received: by 2002:a05:6a21:496:b0:398:71f2:59b7 with SMTP id adf61e73a8af0-398c60e4310mr1515112637.33.1773219392828;
        Wed, 11 Mar 2026 01:56:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:496:b0:398:71f2:59b7 with SMTP id adf61e73a8af0-398c60e4310mr1515088637.33.1773219392343;
        Wed, 11 Mar 2026 01:56:32 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf2725csm1523345a12.13.2026.03.11.01.56.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:56:31 -0700 (PDT)
Message-ID: <497b2adb-bcab-4c81-b6d6-56e7102f416c@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:26:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: crypto: qcom,ice: Allow
 power-domain and iface clk
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
 <20260310-qcom_ice_power_and_clk_vote-v2-1-b9c2a5471d9e@oss.qualcomm.com>
 <a92cbf85-5937-4aef-985e-a5d12031d4e0@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <a92cbf85-5937-4aef-985e-a5d12031d4e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b12e41 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8h99a6YZr-iq8KHAznkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: J-bbKneLi2nwsR4c3DaORmR4BN6oGtkQ
X-Proofpoint-ORIG-GUID: J-bbKneLi2nwsR4c3DaORmR4BN6oGtkQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3NCBTYWx0ZWRfX62cyZdH4oVa4
 2ZdJqjWZRhxxVznKtBCTuakI8/xV9/s0shATvEwUyGNvsUUrZkGtVOrCyWpwJKsEuBlJQMneXn2
 yW1IiW55llJ2DjrGPbOKLKF7voEUWw2aUu8TCkEdtSXUY2XuQr4CQm+1C/UZzCgJ/kF5YKiBBDs
 mfJgJ0wvfvda+q2cBBts0kwBFBgS/kWKp/vyFbTA8h+0wHDF1O6rOYD3RWzB9Xrh3buXXBbiYAz
 w1BSwNYNaAnJAU0Wl6gMWx/hFgOkCwhg3gGsjw7JG3WpgBQrgTUxWmnVutj6GZ7lnhJN3s0xBkQ
 GU37IABq8Wd0Fk+pQj5dmUH61LLW7w0g4muSAUQp60Ewb7orhsDNmZyIfdjCsqvp2nU8P/19jZO
 UFw+JNGCO4X6y430XRgismVx88wt9Azi9QrSFu0d6Qxq5/2yEWZ2wSBqiJM8rptKivNMR6D/Rk7
 45nAIC8JBz8wYeCxSaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110074
X-Rspamd-Queue-Id: 40F662600B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96910-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/10/2026 7:43 PM, Konrad Dybcio wrote:
> On 3/10/26 9:06 AM, Harshal Dev wrote:
>> Update the inline-crypto engine DT binding to allow specifying up to two
>> clocks along with their names and associated power-domain. When the
>> 'clk_ignore_unused' flag is not passed on the kernel command line
>> occasional unclocked ICE hardware register access are observed during ICE
>> driver probe based on the relative timing between the probe and the kernel
>> disabling the unused clocks. On the other hand, when the 'pd_ignore_unused'
>> flag is not passed on the command line, clock 'stuck' issues are
>> observed if the power-domain required by ICE hardware is unused and thus
>> disabled before ICE probe. To avoid these scenarios, the 'iface' clock and
>> the associated power-domain should be specified in the ICE device tree node
>> and the 'iface' clock should be voted on by the ICE driver during probe.
>>
>> Fixes: f6ff91a47ac57 ("dt-bindings: crypto: Add Qualcomm Inline Crypto Engine")
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> index c3408dcf5d20..d9a0a8adf645 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>> @@ -28,6 +28,16 @@ properties:
>>      maxItems: 1
>>  
>>    clocks:
>> +    minItems: 1
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: ice_core_clk
>> +      - const: iface_clk
> 
> Trim the "_clk", we know they're clocks, because they come under.. you
> know.. the 'clocks' property! :D
> 

Ack.

Regards,
Harshal

> Konrad


