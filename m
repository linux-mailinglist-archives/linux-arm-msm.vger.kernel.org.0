Return-Path: <linux-arm-msm+bounces-96312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLTDJq8Hr2kUMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:47:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D8123DD94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 18:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 556B23011A57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 17:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BAF2D780A;
	Mon,  9 Mar 2026 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQcmXvXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jBhUZ5eM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D1277CA4
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078436; cv=none; b=R522yVX/2pt5wdG4iPYMDsZIVMY8dS9I3BagMhWfq30qehL29ey2IZrngs+QR84a5z1j2K8QZlDtMV+PJNGzwBf3ikyZgk87Q9hPNSNRmifu2j9YdFYKRrx9VCKKVz1JOMzfJ0/1/p6yazJhVOZSrDIOVxl7G/X2cyb0fyrNeE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078436; c=relaxed/simple;
	bh=amu4C3+KJMcTnDyB1qFK2SonJmt+nIs3bCqcU7NAbRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIwJVctiXIEAn/hFYVRn3EiKRZ8Irwaeuk3HohtEGk9NJU/JtvTPDXqRJzIIoVh1xSLupAP9xcsA3uliaazEFy9BGzfZ+Q4mJiEOKZW/DacSjEqkbNKj+Em5VNNmcamlm/PcK/Cc3Pr4HFvpnmxMRvt2rVytRiAVPsZzeTvI7pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQcmXvXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jBhUZ5eM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC5HY3280565
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 17:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEVmw5aPLupuoMRwd5bF0YyKWjnchf/iJOwFvIaVwxE=; b=JQcmXvXfIYmOhCDK
	+xTle3Q1wpg6BVDtPRi3M89imTxtkUH6FY3wbG7KggMgUOfakyYysXUcQzYowFIH
	iQLeW9NUjMB89wzVm52zGJGALZHc/1sPQdoARN7hXF94WdfXPv6cpW8mWnz/2Xg+
	GZywC6p16ItDr+i9fHzyLrH45gSfvbGlQC71kxHywOC9rjl3d5k3fqCsk90gv+iY
	PSgt/nw1teI8CeK+xllc/4lJdT+ehfbFGlkEE2hzEY4tXd/JAoDKTrTaVO63LPTb
	5YPNNhz4Q8dTVwuzul53eTRlDvSOOELxlSJkuj2/LQGui/FlFBttg6SQPcrP+5qZ
	YNSNNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcyamju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 17:47:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fec8d44so847922685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773078433; x=1773683233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEVmw5aPLupuoMRwd5bF0YyKWjnchf/iJOwFvIaVwxE=;
        b=jBhUZ5eM62+M0PPDjrjAuqcanWe+EW24EWA+/HbtWq2ZNHMxnEfiIZYKk5mjXGhncF
         Thf7XWLR+rYo0Tq0vf2TEkvaWjXw8OvnJvf42kmbd2Ohn56jhIr4NbCwChVujOFT2hYV
         6I4iMJgXHExc3flUrBkb3+Yr4O6tGv6nFomPCsnZH2tY/S/yl5gMqIbW9OWjSfeIWhPa
         hDLPZpjC7bdujWG2m/Y+1O3WY59eF3LJY7oyeLl91PaSgrQbXmvdC0yopKzI7CXaIias
         o2mkfPcoHMBFYCb58YYmE0tx2Zy2e5iLhfpi7eYYRUtwPssvCNYd/voq6YyVNiKtspRC
         iZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078433; x=1773683233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEVmw5aPLupuoMRwd5bF0YyKWjnchf/iJOwFvIaVwxE=;
        b=BGBUgXZSXc2tqlCCBXp8Pb2gG3wws5sNu3D0w+Eh91yhs6Q8eKR6YygNXdKLZ6SRqh
         dkbtZf+1Vgny5bHeB18knIKmIh0Gfx3TROmXz/NCMzlXh993A1hrx4KwI/NZOddkaavb
         rKITVogFCzv4M21TCJK4GWkVMwV6acyn+DVlmIUWfnmqWJtjO+Kxf4w/zLoBXAJSjHJ8
         +GEqvze5MVPZ3T64rbj+BeXC+2/Cri+zxBEn554BzUPU7NaYyQsPM8ZHcK16Rq6SEG6C
         gBfum5C0bf2WuVbxRNs/5AyoXuWbM8X7nKEFabjMq8WoYLECCXRZnPBHFwhYzXlR3bnH
         eF5w==
X-Forwarded-Encrypted: i=1; AJvYcCXDaYKszgzrHoOJcueeTKv9sIU/Kf/BP2eRa9o+JcKoqiJ6OqSXAjxomhhK9vM6zOqs7M1XcUhVUV81iQNK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17AKsFkCV2wm4GukxFNXHGR2atrSJiR/BNZ7Q3aunVZzNKg89
	cX9AkTzAWjo8rKLq8ageYLNQPGtSKhHuzpew0DVOcvp5YwOPD6/wJpcwFvrS8tC4UlMtF3nck9J
	hAj0a0mDe83H6Djls2s3Ob2tpkTWWAKjA8jKmizBwkv1INB0ESs6O6JrxOp8UDUIs+T3y
X-Gm-Gg: ATEYQzxqnvklYDLdCScWUUoCx+EdtvUlrlqLbHHZKNH4z5Ag3rc/t9QQPfq1KReQTI7
	P1x/1SJ6wwGUSzc7uW38pz1S8qpKo1N09M+GIcFz7utJQdzsmEArzCSFfpkvrkvpKIoljiTkyzb
	DkDaSN/AmbsKpVNWrhqPCDQdOBC2rrgkc/5IEaZesv3tdpZYoCY5b068uSrOIgszzw5onJxfSWe
	6ujyCoIMrJJSti9XMRxyMMHxDXu6eGP0PuTZrNH04Ddd29gDN2iMLqyFluI3/opZaMZOUb1tVLW
	CnmCf4wmb5ZUmJrSwwSV0r7kfRVk8Me95moQprmei7064+/XvDbStta8w1KNE8+mAPV1vCMehE+
	QCFHeKSgw8oGllHD+KDsJS3g8XIqOcSpZDl/AYOBk+PDYb5wa
X-Received: by 2002:a05:620a:1a8b:b0:8cd:8938:f015 with SMTP id af79cd13be357-8cd8938f423mr566096385a.51.1773078432634;
        Mon, 09 Mar 2026 10:47:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a8b:b0:8cd:8938:f015 with SMTP id af79cd13be357-8cd8938f423mr566091585a.51.1773078432132;
        Mon, 09 Mar 2026 10:47:12 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-439dae56300sm27867521f8f.37.2026.03.09.10.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:47:11 -0700 (PDT)
Message-ID: <36bfa98b-05fd-4788-afe5-f28751148889@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 17:47:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] dt-bindings: arm: qcom: add Arduino Monza, VENTUNOQ
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309152420.1404349-4-srinivas.kandagatla@oss.qualcomm.com>
 <82b23341-d0ac-4b44-b50d-ad0eb5509974@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <82b23341-d0ac-4b44-b50d-ad0eb5509974@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE2MCBTYWx0ZWRfX78nW+26CbSFl
 i5t+e58E1nCVeUVj1NOkrjPCFdHrGqjy8rcCEZjlGJ6pnU4Ro70Kbl5znlOW7eYnNEMhsKkB52M
 Y4COBXrLwYk0MN+ESZUjyFDn9Zuk9fWTWWG0QHDJ9KE+xTxkT1iNL2osM2HqtThT8cTGE672fPF
 ugrxWc740RdsxH6Kb/ZSqj43I0siRtApIdjJCzv2omf+o/ApWRXk7Ugy/ahnbpr9KblPjbflAcU
 4F2Z9GCm/sZ/cvr77hz3pqo7weF6LeB3OSkFGsbO2Bods75R+csq6wJJHD2ykaTv3jliB58dTTM
 TerX2GRqUg6Vj2fuxasSythKjxn0jsMxQsZDV2UWMTs23PNTjj1eo0DPKaTUsAAUKHydA015IWj
 BogSGDAB/ZWZN3sIBHP8FI7VGxlIBF4/o3J8Hq+FsPvhohLPYqOd2gdahG42B3KKXCp3CcdpKAC
 slC1cZrqMIQtHbap6Og==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af07a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KQ5Aj9_w7GlCoQvhwioA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: YZKs7zTY66sZfBk2maIeoDBFfiHy1TfJ
X-Proofpoint-GUID: YZKs7zTY66sZfBk2maIeoDBFfiHy1TfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090160
X-Rspamd-Queue-Id: 53D8123DD94
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	TAGGED_FROM(0.00)[bounces-96312-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 3:50 PM, Krzysztof Kozlowski wrote:
> On 09/03/2026 16:24, Srinivas Kandagatla wrote:
>> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>
>> Document Arduino monza, VENTUNOQ codename. It combines Monaco
>> based SoM with STMicroelectronics STM32H5 microcontroller.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> I wonder how two people were developing simple one compatible change and...
> 
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 153664da91d9..2edef7e86175 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -890,6 +890,7 @@ properties:
>>            - enum:
>>                - qcom,monaco-evk
>>                - qcom,qcs8300-ride
>> +              - arduino,monza
> 
> ... still place it in wrong order.
Thanks Krzysztof, I should have looked at this carefully

> 
> Best regards,
> Krzysztof


