Return-Path: <linux-arm-msm+bounces-103581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOKcIrvb4mlu/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 03:17:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5F41F945
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 03:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 254EA3069634
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6D125F994;
	Sat, 18 Apr 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Th5b1BZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjnX8eiD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7C81A9B46
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 01:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776475059; cv=none; b=KOHs7hjsZYViNRgYE7tC3f1tfPwjQH24FL+KkxxwmVhLV2tJuqDlRFKYC5gas0TNPXxvrdhQaUlPb2S262FCzPDiQE+/odFb4v8G1dpOzwDuxs/RqgwKEiiw1M3xD8Rx9SnX5TZYsCKyXKfpTjQKaANztxFq3Qn+D8PN9h8aOWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776475059; c=relaxed/simple;
	bh=vrk+ZxD6f5SDsNJ1t+XmdCDFGlS3EoLtdGwPya8DYYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMyuQutQ2m9EXmEEB5ker6CnAEMbgQJJKVJmrLSMUm73pKPL44QdPeiQmAYqdd6vvkbdCmb6JLlXKbVsSxtrMKDXWsIzXY0A4biAPdFx1PHf+zJic2r3dhR0I8SNLWs7Eld8dvSO5giEkhNxv4UNGafUWLue4SEkSEcuWDS03jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Th5b1BZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjnX8eiD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4AOL3929269
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 01:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSaK19+lqSQMB8BSrlpU+L7Q5JHSk5dmmbOrWGOZ0L4=; b=Th5b1BZ/+pSHHH6n
	YBgKCTuh4wt8/mSBgN6fW1kIKmkT9xEC2Del8WfrcY1WIWSNAHpzZdJznoAwzz4Z
	ZQOBFjZpX4JryRHnKX5rQYltTyDeWw9kdQ/5qMmdz5zBg/rQWDlNUHBq6rqzkc2t
	QO3mzRCzh3DFJLzzqQn9MadrvHsrZOWOXTIui+WqrV8qsqh3YAZ6g9utupF/HbwS
	qbNxgWr60QLu++BEfDa0Ntoom6IZC0miJKNPDgl16ohd6S5MGZtySS79A/F3HgNh
	SL3yjHafbuqzn6c5Xx7rbSXpY3LkY7meUhCFVwnw/6u+CW8n6LWwAvESfZhP85Dc
	GKG3pw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkqujhbj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 01:17:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f9429f49cso1054374b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776475056; x=1777079856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSaK19+lqSQMB8BSrlpU+L7Q5JHSk5dmmbOrWGOZ0L4=;
        b=EjnX8eiDtW3qgC9wt//gDvLwa6RzGTnOXVNpEp/OZE/UKaDEomng4oXbxKUKU5kL1j
         Sq4IsESmbRbjzFiohquXgRU7JL01wJ3pUgKiiC4bEgbN71fNrhUmdPwzfKg78nVka1t4
         xNC54BvgKxMeDcSdmOwtOizGmQfcPhMuC/w0N3ZgO/WB8MFUcCO1J27M+PNRmtVy28ql
         O1gE6lRwtb8IfHZDUTJPYd01E201bPSZpVr9K5b+NlPyh7KRZE2783rFZ0nXZvJ2Hdiq
         7WkNN7VbnokQwzcGpSF1cKQNwcEcyymqLaMgsVTTrDHuJ2piOhMlJx5qx8hih3e9u4Uu
         +Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776475056; x=1777079856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSaK19+lqSQMB8BSrlpU+L7Q5JHSk5dmmbOrWGOZ0L4=;
        b=LHzGuN8rVWjuDLR4JMn+WKxf0E6+UfbsMxz7HRLfytR/AtRbVBTCxBPfdxNhmH0lpv
         I/2EVh+T5mSbnrzP3ADHEA9/gRIktkEW/jgwc2inXUzvXLw8o9WxueK5iEIu2YOEIYzG
         otjfRodSMNqf8vQ+HFPDqkYkBTGGIunnJ5HNRiaM60vsl7oHI9vqPfpWCwGIaRnpNVyK
         775hIfRJUhITkXjVY13C8B0BhQIz9jf578GpLYJ0NRf7d7Jn+Fukb/nPdbV/T6jqII7k
         lCcVck7htNllRe1UzN4TPUYNEmVeHkSTA93rLZ3ZoKuGVowok+Imwvji5YgDRwa1xnnr
         V9Tg==
X-Gm-Message-State: AOJu0YxB95J/jJYklkpxnGGVhtL8o+Xr2spGCq8zuBvM3WIMy9Z0K2/d
	fV0NW+azu/1uED7+4MRL669q98ycYZ4PXoFvfADqmaaM5perQhlDBFNyIoc1UWYwISBZT8VgGRj
	uWq+3qw/SoSXI4ei4HhSOTCqRpsOCZgNtHxtUiasYfrEkVwCTQ9Xn0Gno210C/O064gl2
X-Gm-Gg: AeBDiesGMODLf3RynIZqcggpH0v/sIvpvcbzUslRS4sMnQXFkjt3nsrvoQscGaWuesb
	BJQQrFpKdv+4BurZDsTYRfDqB2W621S/kQcu2akwr+RVcxx+NbdrOr8BmjhQWiDmIdr1nZHKs0l
	p8yZ7GBFFLcNR9WkjvPnK2TqhAiZNrtagjTSYqqJGgl/erUmJjhBMqnc2xml7PfQfRGhRyGVdvS
	9KagbE0iE5dWjLBtqviYPKU+fUxMPlYQWYaZBqmtabXyqs7Fp9dQujZ8IltLQUUN0ThRC/szGLY
	6nXmFxzfS+LBmUtMxJJicVyTbxCDAt1kbXESXYjle4m9nfwoveq/lXWzUeAv+B2nVEsXaWaONwP
	jKLsFK4NxvfcyEcvGhA5uh+ypBQ1SXGkqNL+N+DZvO1/H4WCpRWC6jwHrMDkDTuXg
X-Received: by 2002:a05:6a00:22cc:b0:82a:1044:3563 with SMTP id d2e1a72fcca58-82f8c902bcamr5776942b3a.23.1776475056107;
        Fri, 17 Apr 2026 18:17:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:22cc:b0:82a:1044:3563 with SMTP id d2e1a72fcca58-82f8c902bcamr5776910b3a.23.1776475055643;
        Fri, 17 Apr 2026 18:17:35 -0700 (PDT)
Received: from [192.168.1.10] ([122.179.227.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm3359151b3a.2.2026.04.17.18.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 18:17:35 -0700 (PDT)
Message-ID: <d9eb2350-6d51-4638-99b8-5afdbfd4928f@oss.qualcomm.com>
Date: Sat, 18 Apr 2026 06:47:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
 <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
 <760729E8-7CD2-45DE-B3FB-7A28611E5EF6@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <760729E8-7CD2-45DE-B3FB-7A28611E5EF6@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDAwOSBTYWx0ZWRfXw8Fn4uTYZMyA
 ZAFUX6Vq8JpL75MMECsr0Rza/tNqCcFTwdJ4IJ1inupy6xKVDAP9dbixJBBKuUtDSyaZI1cg+zS
 6bJzfaTgQO97dcv+57dQreL6ZVvwQZArEzjp+03LIL188SSIkrp3SX7xfY/NtjELbp8YBXzT3DR
 c5U0Jq4ppUCBXXkDJmkLASFZtAlqR0pYGIhZOYFj2Qd8+iSdB62lbbnDFSa/rVlLynGLOuhHpb1
 BpBvZZDYOQuK8p7JOGqqXl8MqdvGyKpTt7zMIsmzmBsJEMGui6hUSmDZEla4TbgUp7CMgsLfnjc
 jqz8eZtjHcbqlnAkN59wGYEQ404TrArxYaaSLWsflxS7DBHoWxN1xcxD3iSbE/l0UTQE3CB4dWn
 M0gxJV4RTHFBC+xLccXfTnW1K8/w/y6vu9/vKa3AqgY5iRimzQJyQil8zYPI2K5cDe98MPa6789
 YHfLh3caXaS4i6gZlJw==
X-Proofpoint-ORIG-GUID: IN3KN64xrJgMikVVHiuz13Y5xdcejVdh
X-Authority-Analysis: v=2.4 cv=FP0rAeos c=1 sm=1 tr=0 ts=69e2dbb1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xJoAcIQ2wYp4krwY+vXiHQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Gv3PURsRAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=IaGPFpG_6dTtC4rlnaIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: IN3KN64xrJgMikVVHiuz13Y5xdcejVdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180009
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,f6000000:email,mainlining.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103581-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8A5F41F945
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17-04-2026 23:06, Nickolay Goppen wrote:
> I'm assigning this region in the fourth patch
Okay, I see. Thanks for pointing it out.
> 
> 17 апреля 2026 г. 18:15:45 GMT+03:00, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com> wrote:
>> On 15-04-2026 15:22, Konrad Dybcio wrote:
>>> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>>>> Downstream [1] this region is marked as shared and reusable so
>>>> describe it that way.
>>>>
>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>>
>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>> ---
>>>
>>> +Ekansh some insight, please?
>>>
>>> We're giving away that memory via qcom_scm_assign_mem() anyway
>>> and I would assume that making it not-"no-map" could introduce issues
>>> when the OS tries to access that region
>>>
>> With the current version and the upcoming planned enhancements, I don't
>> see any major benefits of making this as not-"no-map".
>>
>> With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
>> entire memory-region to lpass VMIDs. and un-assign it only during
>> fastrpc_rpmsg_remove(). There have been implementation in downstream
>> where this memory is dumped in case of SSR or audio PDR using minidump,
>> so marking it `reusable` might make sense there, but that dump logic is
>> not added upstream.
>>
>> Upon checking the DT, I see a bigger problem here, this memory-region
>> looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
>> Please correct me if I am wrong about this point.
>>
>> [1]
>> https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
>>
>> //Ekansh
>>> Konrad
>>>
>>>
>>>>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> index 4b47efdb57b2..13094b5e9339 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>>>  		};
>>>>  
>>>>  		adsp_mem: adsp-region@f6000000 {
>>>> +			compatible = "shared-dma-pool";
>>>>  			reg = <0x0 0xf6000000 0x0 0x800000>;
>>>> -			no-map;
>>>> +			reusable;
>>>>  		};
>>>>  
>>>>  		qseecom_mem: qseecom-region@f6800000 {
>>>>
> 
> Best regards
> Nickolay


