Return-Path: <linux-arm-msm+bounces-96991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBc0NMdrsWkuvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:19:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E1D264503
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7F913014619
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42E330DED1;
	Wed, 11 Mar 2026 13:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="au8FQbl2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/WcocyP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3EC298CA3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235141; cv=none; b=brgywHrpmnh2sTo1FzS9Du3vmVkpxE/zCfZl82PosW+P6SFoErTYe873Ylc76tAugbt74pACqNe0hAqfQ4pzD3x4xGGvSM5r88YuYoAGpKp8HLkQwhRvwE+fTwN7H32bG/QcjCRFVa3q76RJ8sMREgQtnJBxHnV1KNPdTps8654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235141; c=relaxed/simple;
	bh=up6tB7Ez5pD/diJjTrqZAIDYC70qJs8r98DmPwTxwgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlM0UdPo+sJ1whk7E7MemgHJO0DuoGL0GTA8o0jQ2wRzNMwseXMpK3nFkAwRWwYhGky17Jiv/CQohkInbnlGOgYbzl0mNoGWjr0mWWAbJeeVSPajgzMnAx3LRukD27yWOZWWzhwrYgh1HmggoOkTT4VT3SWzG9D/KX8+Z7Y9RFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=au8FQbl2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/WcocyP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9T7hu1573018
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hdC4EqaPGJ8FczoB8g45Qjit9jp0+KUk2mHc/9qscNA=; b=au8FQbl2vjTgesTF
	WCfjWaLFnqos7TzkVHEihMYDr9l9lBCpAs5uC49z6Okvq+bDTH4WGWAzgO4Mf3WP
	aT30ZFFNiq1J5JdDx/z7Tv2j4ZduMN1F0DRkUIMRt5Ni4XvWsNFGPt1kdEsyXjje
	vBlYnsYdc3RSf3Gxjg2B968eI38PLP/0eGvPYi8abCvu2b1BGWIM3jwOQq16dfLr
	5kTXubKIEJhy0IBTtmcBCkyF5ZyWGH4/C+mBoBm1otsI6hxkZoRuvUsNDSHXwymk
	Fr7Bjspm0UPlzfctxtSj4VGRZAsm0U7byvq6DABi0D28ZQb5tQdBKAY3X2TPR/dY
	6MIypA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkbqqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:18:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd8e89d19bso181307985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773235139; x=1773839939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hdC4EqaPGJ8FczoB8g45Qjit9jp0+KUk2mHc/9qscNA=;
        b=K/WcocyPjDXXwRgoPlvVgq8PROe/Z04X0lpCGAmVBgR94Q5llFFG1an0gXBvCtQlXT
         iWiOpFn33tpbKBPx0WF+v4ImS1/vgXq+ynmG4POWkAQHbT/43JZU2mZLqKoTTWXDTHec
         i/eEL605S+xnp+Ay99EJ3d+9yo6fDxPqGPrSwKI9M7vZ6cOa7JC8P4G8ccdIk+x2D23y
         UR3DP/I6x5HihdcNYLK7NPEMn78mzJs70E1FmZ42CO1+5pOZxMXT3Vugf5nj9YTq1ikV
         fgrTbSodlo3cz/FA17pAZkSKA0Q0e4IgUPAyH58Pph985Jpb759s8NopIye/XN7EIZWp
         ak3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235139; x=1773839939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdC4EqaPGJ8FczoB8g45Qjit9jp0+KUk2mHc/9qscNA=;
        b=qxiqp5fTv55C3szKo8SRqKhUaaRYHv1Ozh6aXffxMmN2gRMemhN/jznnL9rFQ6Z2Xa
         P5gLOdwZSC3/DZyB13hjgQXSPmL8UcUK5xV1q5OREwh/8bAb7QmZJLpYMU06bDOJENIZ
         3E3MncRBRFnEW69kgoTriNBEAJ2FB50JuOUhn7hpNTuK7rR+YJI2g1bBR3v3yV9jei/1
         bE9IEyitZhKsTn19JsVHPXVWRze8Udfh7PWLeu4WKH1V4RFK8eKd18BByP237RnijU44
         3E0Wjz+oxY39EnjxLrG6g/kIJL3zqAUF7yRHo6wq0uKny5SdTGvyDWKWr9K/V9WB9yx5
         RpZg==
X-Forwarded-Encrypted: i=1; AJvYcCWWX7exwmGwRc9JLCX69TA6Ec76zR7kbni6c31Gs5+f1okvceiMvGXbz7NyEX05WkT5e9utVi6RtmW0wC0g@vger.kernel.org
X-Gm-Message-State: AOJu0Yweiz0e/+t2sFclseN1O2TZF68jV13QneINmP+zqy8VfCd4HCNP
	3+i4Mwtcj0IJKfRAtLip8lvG/tZddebdJ7a9JGiHqlejUyHZR7XG5eOVyzkuy5P3ydi0ZsSNAxy
	ZkZ+wMJveTOEaQ74Qi6I9bhhkTbAOYwczn8i45JA0LUIjLJdBSwa6ZwinbyRs9G86HcJ0
X-Gm-Gg: ATEYQzyPcBlooc0MtBaJWgftl4UlFEzOeaA8ng5VJw9X0ninZBupmWbM0tetbGkFEH0
	HXh5lOSF9YhSc3tENW1qDSepWklX5LVG2tv4b6k434LgFe5b+noZBOKvw7p88hCk1LXMflH9p9/
	K5fGMgqPzNLQX7AKTYPO0s7s93XY0mvfJIo+75hLw9Lxpz224owME0RIgrO6L21ZRczVOvJdHry
	Il5z2cwxYX5TrTAaRO+g0JyOtRVyLvobo1cfR3a3ZmCLX1P8zxGwxB2AGZD8zlhrQ0ocNFItUGk
	TpO7e3wk3mMi4ZcEaLrRapOp4e/6iMqXjrybTD4zshOWMQEJECYpovva6V+yvREqqUhFfZ87UzC
	CKe7SVnXYGli4AyG7fuwvCO++8TwHGYXz3Cqe0Ef5Zw0qYpwIQ8Ty3eipEBWfVUakQEX9KmnA9u
	Gh9eU=
X-Received: by 2002:a05:620a:31a5:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cda1a84b30mr256497685a.9.1773235138923;
        Wed, 11 Mar 2026 06:18:58 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cda1a84b30mr256495185a.9.1773235138501;
        Wed, 11 Mar 2026 06:18:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e18e238sm54861266b.48.2026.03.11.06.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:18:52 -0700 (PDT)
Message-ID: <c3b1191c-e705-4a93-946b-0303c927045c@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:18:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] i2c: qcom-cci: Add DT property for SCL clock
 stretching
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, ckeitz@amazon.com,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260305-cci-scl-stretch-v1-0-8412abc65745@amazon.com>
 <CAFEp6-3ZuSOW4apj2Ww2DJ5_5Gw-CDXV_9Qc2=wW-JLP8Vbatg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3ZuSOW4apj2Ww2DJ5_5Gw-CDXV_9Qc2=wW-JLP8Vbatg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pbd0JzQjRPi0o2ML11sLd4It7JwWG8cx
X-Proofpoint-ORIG-GUID: Pbd0JzQjRPi0o2ML11sLd4It7JwWG8cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMiBTYWx0ZWRfXz/P3apjVR9Ny
 QwYjn8CJ5oHWk+HG5N8u48v8LJDKmP6sP1voDtq0zNDuU8Gxx2Tc/4ubyxS9uWdQJUgsG7Qqu6+
 Wdg9t81n1jVZwEDrKGLyMZvlJM0GzPiJottCd+cQQdw3mRKG8WS9TYSw9UJP7rMONwG9/4dN+M1
 jab3Ya/Okxoamg9LTJBM600MEynwk3jxVVdey71YMVPvitm355ojOdMcykEdsSaXZPec5xLJW8c
 HfZjXRSjvL7NIlY0TsNixiEdWrRfh65RskyzF9yQUurYzLy11c17BXTrA/hYp/AHtQzdayzPxh9
 vQnKfgBjyMaLqg5WuyHrQWzS/zh+BtXkzvrDuYh+Xy7bRAQUlHVh+IZOLlkbOa2ovSdk2DBzjGQ
 i8umagWCMlZUELYTbF1P0Oqy8mm+43CaSx5ZF7ceEFWHM5UgqJXe+ELq6IwnFaF6YiTrxnt6w/v
 HqpVcIFVkKv0VuS07vw==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b16bc3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=p0SCdqENNPgbPqcv8GAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110112
X-Rspamd-Queue-Id: 63E1D264503
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96991-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/5/26 4:16 PM, Loic Poulain wrote:
> Hi Cory,
> 
> On Thu, Mar 5, 2026 at 3:40 PM Cory Keitz via B4 Relay
> <devnull+ckeitz.amazon.com@kernel.org> wrote:
>>
>> The Qualcomm CCI I2C controller has an SCL clock stretch enable bit in
>> the MISC_CTL register. Currently the driver hardcodes this off in
>> per-SoC hw_params tables, with no way to enable it from the device tree
>> on a per-master basis.
>>
>> Clock stretching is required for GMSL configurations where the
>> deserializer uses it to absorb the latency imposed by forwarding I2C
>> transactions across the serial link. Without it, the CCI master exhibits
>> intermittent transaction failure.
>>
>> This series adds a "qcom,scl-stretch-enable" boolean DT property to
>> individual CCI i2c-bus sub-nodes. The property ORs with the existing
>> hw_params default so it is purely additive and does not affect masters
>> that do not set it.
>>
>> Tested on sa8775p using the qcom,sm8250-cci compatible string with two
>> CCI buses connected to one max96724/max96717 GMSL2 pair each. Enabling
>> this property eliminated intermittent NACK errors during serializer
>> and/or deserializer probe.
> 
> I'm not convinced this kind of hardware behaviour belongs in
> devicetree. As far as I understand, clock stretching is part of the
> I2C specification, and slaves are allowed to use it whenever they need
> additional time. Masters are therefore expected to tolerate
> stretching. Given that, why not enable it unconditionally in the
> driver? Is there any downside to doing so?

+Mukesh may be able to help

Konrad

