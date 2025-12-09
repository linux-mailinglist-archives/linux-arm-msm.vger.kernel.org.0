Return-Path: <linux-arm-msm+bounces-84724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC38CAEE4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 05:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9602F3007DB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 04:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAAE262FE7;
	Tue,  9 Dec 2025 04:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTMvkw99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q9z9nvXS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E59225417
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 04:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254998; cv=none; b=Kfu0Ej3e/4488AbR/kbrgI3IchhTot66RmZ01ff1yMclIEVKTXwj0ae8tFQMQGbnQOmvuR2dZKIkrlTt1VNehKbeyT/eExRJytVISNhgIVaRBlIJeJ95uyrqYm1cKsaC3h+9n7IhChTTawidIDlcCYn4oGCdNbFv9yTkpDyVGVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254998; c=relaxed/simple;
	bh=GThSbvjbToT2JrFsO0luYZiceKv+rcGmeMOARrySPFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHSSpa+2Xvc/Oy8AJ28uKEHgUVvIQUxhLeA7AH2AclNRuru8IPIiIJpdPuIVfF8eXqkiZP5fduZxXm7G5Z4BJgv1CgKDnDh0MeYLT9BrHKF2cVkbDwK1dZXGqna5qY818tNTDCFLl8AMLwsz5B2CwYLDOS0LkIa/u1g8Ku3VZ0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTMvkw99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q9z9nvXS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXIGt1311723
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 04:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4c0Tq/BmToaocMx8xkBZuMcN9gE+0JfPotxMOnM9Po=; b=bTMvkw99QUkbbfTv
	+xpK3imneg7y1i0Pg9HVamNOgKumnVkw5+xh/FmiLR/n2GLy76JOafau6dff648V
	dGGN5iaIcYHOCv+7Okj6CnNQcFsxu8XOt8hNPDKTXyn6Lwjk5VQKQejKe5DUPJtb
	kU3Ohz2cZjK4vaT2DITRN3V1yArsD001CzdzshpA/p2NpfpXHa+NRPVdGGGLMuUe
	wMFRisYnwWqd13oS4z+dt50PHmXw/XyDtiqIhY5coTVqkEb1fI6SRiM9ojh4gp3M
	ZjqqCTyM+JTj18thl9FRm5M+YLOa6w6Ftoxuf4DSALV6+46X5BiyrRBaPiFaL+Am
	mXNt2A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awthpbde2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 04:36:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bf06c3426b7so9106677a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 20:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765254996; x=1765859796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4c0Tq/BmToaocMx8xkBZuMcN9gE+0JfPotxMOnM9Po=;
        b=Q9z9nvXS9R9zNMUAmih7ZhpFwFuXEl5YzvDJuIkvqH/3113EWARmjEff2rkGNyDJgc
         HImyTOrts6JmLc/N421ItvMq93858W1650TK5ai7FM2+yeExEi1aPfuODrn0ESgcOy5J
         TeZqdTeVUxegVxL3BgzEZGwKozzP5K4mJL98jrna6lCnEgjs446NFFCSa4c3a2EC1a4D
         9L0UIT124AU4V2JM3DWKI7B1IZfG2rDrPFRrTJV14mtsgkUtUeepjIA9P2OG0doXvW3l
         w3Ihxdnms22g4+Cq0/JrPLeLtSm0MpT4oAaaqe8mLIp4dNMybja6rAHEieCLqvU1EGG8
         3x9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254996; x=1765859796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4c0Tq/BmToaocMx8xkBZuMcN9gE+0JfPotxMOnM9Po=;
        b=Jy6fDRDl2ujgnRkkMcr2Dm5Kh7dG2RI7BrJEul+o2s0b41AEgfBlErEkmf9COaMU1B
         dE+0WLQQnV00iGooW52w8TWPaTVKV5i0q2r4bGueiwSpkFCdTgwtR6TTjCp6GbT+Q8S3
         2xCFD62tmvJhWXlf7Uby3qzmCW3xEySiPfY6vQo/N5e6q2fhB+FgnOAgVoHLsKBBAW2d
         +H6+RkedDWM/rqgagyWqcXFAoCBRc27O+uT8vcdq2m5SVTgymFCI1yceiaVn8e+SSVkw
         7x6Zqfcp+cJXeZlocDBGb8ACmVJ+kO+TP2vyptrz9rnPlVhxsxIU+OeBqChvZ/DT3qH8
         N+sg==
X-Forwarded-Encrypted: i=1; AJvYcCV+NDzV5AMUWRyFsmSCAy+ob1j/LBAwDoquvQDnDHldGnUUEu2BXw3AXQyMlgW3GZDPHNRPC6j5hUhAWMET@vger.kernel.org
X-Gm-Message-State: AOJu0YwjcG4KgFE3Z+FJRz5Mczr9ZrwWJaqsV6Yux7n+9CWZcQqBL3FM
	OJSDUA88+neTzpRo0YwFzAQ2Db7OMhXKBRmHIhZmUglHca7YKalBhxXIj6KLwAx4QsbcAEAHyCT
	arZU6avz6ziJtFfcJwxOTluEEwXI1yXnzYzVTVY8heyM2uDYmzQw4LqP3IkA+YSxYK9ZK
X-Gm-Gg: ASbGncsLkpb9otgcPEIAo8q9pd+YFH6f1CfWVijmyN3GWRem8nzJfxYySrBzUfCx4GK
	Bwu98wFHnegccWln4BJg8TQN1KxNN01scGXcSoJOsNkzSiHywLCrns+nBh5FqIIKdHdv9H1UPDu
	6CVYAEdFUVPQ4RvLx5GZL++Kqcyilk+yRjRGOjhwMT1gwuAJ7lrUVbQu/ur/7piB+ivlzj5jwkX
	Yb3KetRL9irBpJ1lO5YOc5YoPKiLxRSkS2u/+RMBYh47gz07AlAerJYE5vUrV/eliw2dH6gKkfv
	aUlZKskmr3gNV7/1LZBp921JhPGoKQciyazGEgo+db8pNKgBU11BVzajlg44f8cUjdTPahYtJkI
	vHbBpChNu2fCUt9aXMURSmWsRIHWbLl9L3Rdblt7INEXz1w==
X-Received: by 2002:a05:7301:fae:b0:2a4:3593:9698 with SMTP id 5a478bee46e88-2abc71f7ec6mr6465300eec.21.1765254995506;
        Mon, 08 Dec 2025 20:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgu4aPb0+lj4MxhGBo4aAChAGZ01Kns/S/0CeavX4HExSHWEmqMwaWLLzXzoMHs39iBx8u4g==
X-Received: by 2002:a05:7301:fae:b0:2a4:3593:9698 with SMTP id 5a478bee46e88-2abc71f7ec6mr6465273eec.21.1765254994907;
        Mon, 08 Dec 2025 20:36:34 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm40914062eec.3.2025.12.08.20.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 20:36:34 -0800 (PST)
Message-ID: <db033ab1-9b5f-41e7-8048-3ae327b48ad4@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 10:06:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 squelch param update
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
 <20251204044644.3072086-2-krishna.kurapati@oss.qualcomm.com>
 <fxf66ulont7wnmozqww2cklpp3djkzsgvc3znew4m7t47qlye7@32hxp3yze7h5>
 <20251206-efficient-tireless-dragonfly-c5d2ff@quoll>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20251206-efficient-tireless-dragonfly-c5d2ff@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAzMiBTYWx0ZWRfX034SYMjyQRlS
 oVTjgiYvfYBlncvINBYjS+k5E0zZCF8z/zZyhYZ0jajS26qLSLZKv8sjW759oB82t8rstMpq3tq
 jdpTT2pXg0C1X0uJVRdblAkvFC78rFRdH74unxeYViWAUMQnuzvpH0a9spSxGFYSJh7faPctHet
 tcjd1zhWjVM5q3WyYsPXExhHJ9QSBbdXIHL938SKX4mfw2dsP3F7hh481iPrE6lYFFevOrgQJcJ
 a0WftBUV6MiOWGb4rfV4czf3MfMLXJzCG+8AD0zDu/nWkbayNcy9OWij1G6JEJvMR9oysSdwgib
 7+Fsi31t4aN1vI4zmESJ28cHIE095WflsewNzBZxeq/Gf231Utuy/j7tKOrShRUO+x7s9EGRtKC
 Q4rZzL+9VBgtCCuHuMYvcF8ho0SN2A==
X-Proofpoint-GUID: ysHGb-iTXFtQyQVJrB6cd_7uQsEqwtT8
X-Authority-Analysis: v=2.4 cv=AL1K5/Xh c=1 sm=1 tr=0 ts=6937a754 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MsxH4LtXGSFWTCPOqMgA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: ysHGb-iTXFtQyQVJrB6cd_7uQsEqwtT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090032



On 12/6/2025 4:32 PM, Krzysztof Kozlowski wrote:
> On Fri, Dec 05, 2025 at 10:55:36PM +0200, Dmitry Baryshkov wrote:
>> On Thu, Dec 04, 2025 at 10:16:42AM +0530, Krishna Kurapati wrote:
>>> Add squelch detect parameter update for synopsys eusb2 repeater.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>>> index 5bf0d6c9c025..f2afcf0e986a 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
>>> @@ -59,6 +59,14 @@ properties:
>>>       minimum: 0
>>>       maximum: 7
>>>   
>>> +  qcom,squelch-detector-bp:
>>
>> -uV? -mV?
> 
> If thi sis adjustment in ratio, then bp is correct. Some sort of
> explanation in commit msg would be nice, but I don't want to stall the
> patchset for that.
> 
> Assuming this is indeed ratio without actual SI units:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Thanks for the RB Krzysztof,

  Can I update the following as commit text and retain your RB when 
sending v3:

"Add squelch detect parameter update for synopsys eusb2 repeater. The
values (indicated in basis-points) depict a percentage change with
respect to the nominal value."


Regards,
Krishna,

