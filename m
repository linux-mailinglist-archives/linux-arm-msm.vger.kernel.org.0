Return-Path: <linux-arm-msm+bounces-93513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDqfMtdymGkoIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:42:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478D1687BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:42:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C73D30E83FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B73284671;
	Fri, 20 Feb 2026 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPjLrKRR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDdRFtpW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D0C28003A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598213; cv=none; b=LyZcFYCVjP7SEesyYoptDJHn9Ol760v+htPd/tESucYX8xbWcIqxeQHagPIX4ixi7NgpvXuldu8a5n6IRtARmbVrGTvmU2en1niXNjiGYG6orATQA3IH1tSvd5nEs4M728SQGcUE4+gEnlksU3Sgwd2avWbyV6cpO0DTyNcmwEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598213; c=relaxed/simple;
	bh=JUR1nNJ7jsi39c2LvNc84POjsTo+kQhIYTHw0OmyLtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKqWqQFyxi66WExf37VuVXQn2so/5rjScVu3o11eZS7Fc8XmC5oWxUIVwIPN2GoC+QIlWEDftE0/PIsDjENKX9ZvpSKZsvYGXrk2BlMsZV4dSoHGsXcYVwBgmAaLzi2wflGXPwCxAMw5G/Zvp76/oNsivnMttt2khRrWqIOODCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPjLrKRR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDdRFtpW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RqK72552826
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MarWudrUci/IfkGN7mqcPI87qZg4EMXn4IkqzVLSvA=; b=fPjLrKRRA7SdZbtm
	qPjwx2/f9u78/i+rQwbi0IxUFiuI7sW1nT9dj0UjDu9v781WZ48OqYO0X87Wk6XL
	/BuTcRwkq/Ia9FqD7KM+/66zKscHOycIZpLGSD5Hjq80JI7M95uj2WYI/THL1DG+
	aGN7QOKzEmKS1LNb6Pig7YNvFZ258kRS7raJvvBg9VaY+gCIhKnFIYOsEzJW9caW
	qKpdjf7fd6kO1VdZS2zfax4ToafFg6knjthfa9H9iPm2eR4kuTVe6mHKS026DQXM
	NxDeRXV+c/tsGesR5wTD42vEWATzpmlLkzTt0v5slSeQXTX9D6NfXVJ8Qf0W2MC0
	vl6Ozg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh7t1a1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 14:36:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso217600885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771598210; x=1772203010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MarWudrUci/IfkGN7mqcPI87qZg4EMXn4IkqzVLSvA=;
        b=VDdRFtpWJgLiQZ1kVIy4oIIDm3qd30xr/dMPL8wtjlSoK78nNq8VeeUPVEdYyEHHnO
         WLRWDnWH5E4CYp/J7fAg+vpOdIiWiGcCZSt9ns2LNkSaTQd76lmlkhTTKp1Y9lWoLjwS
         wYhx8TzbQcX5NSzrZb+DNrg3soezLo/4d7W3xBM5hk2r+2OOMmB4hrbSgYoQBYYqpn7/
         hr3IhtvpXxvM/qLyYNLEj3+NevtwNeDYo8VmbuTA2d0sBfRH5XxrneS4mkd0TMworMlg
         Mm9fNhK3NPa43rMod1zLmXdYT2LfIBX06uXoWk+MCXXk1gjV19YUMhuB9uUBfQ2Nh8Am
         iCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771598210; x=1772203010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MarWudrUci/IfkGN7mqcPI87qZg4EMXn4IkqzVLSvA=;
        b=ZfjN6csL9eiEzwZGDEzDC9ZZsQYUTJ4SeoNRSjKLpRBtf6Kib9hDYILI9A1clYHZeZ
         8QBxtuXtA1DOH6P1Gb35D4A8mdtEpjsI6ShrH39z2+rlxLrZE8wym2PMa6cT+Y9MXFZO
         gu31SbjU0oELGK+/u7/MvmhPCqE5oW1Q9tPaGdXlLQ879sQ6RlEoq9/vF+MPNOyH7fGE
         hLlWrcyGi/yT5ibcEhwpff7eXIMOc8w6fb717AAglF2K+WVHLUvCv+QF5+GxT7zZWVCN
         78YyLQ7c2Moc9eHaP54IKRHigqKJmeLfsZ7arPIxevcG7FEVYOxQyaIJr+Nne/1szqHr
         e1zA==
X-Forwarded-Encrypted: i=1; AJvYcCU9A7ZiSTB0i4sHCJJxnoMDmrle9ibSy9K2VF703xrXUCEf3X/+3NbyDrPRo8POf2GHYuGyWsjJ6q64Apvh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ehcpDy62YvAfnBbnodXiUwgATLuHkkBfNVuutJ2QimiAjm3I
	rscL4sAeZqyvuEGELqxMS6nCYmk7F3NH9dfRbIbOYsZWbIuN1ez8thUL1wyiNLotB4epVRdehm0
	IUky5ZQ6/sksHcCJ1Sx8Tk8PaCNDvS071jGO6xis4tkQLGMAzYh3Ou/CF6DetUaY1gBht
X-Gm-Gg: AZuq6aJ8QX2aLGMd+IaPoKvJPSsq8z/TBTGFHFv6dHyCRnha9ehkT2dTYmb2LekbrMS
	dKJPbXKn6KctlhUP7/FyiqCLSAeQY/5/OJy6dUwWQzIeWiaNrY/HiDy7SOkOlnzI11zFEc5gedz
	KhLjEyxGZMcs6heJqNZ5mqyIp9bz5KF+cwQPE34nod4LTvfVOqvskAvekKTvVJz+q+3DvDdgDiH
	DVb7B9pRaNiqp2HvOUT4LoQSxkFyQt1dsw/vznczJNYCRygy53a2WXECrT6TIBJdNhPo0Nu1yJ0
	dSz64olWw4QlBmk2/jHtbbg4/ngkTRV1bvBsfkm63806LqckMGlfvy0iNb2wiI3un4Nx117okoP
	87Rf6L7afJLW7wsIH3Kt+YIlbAhuPYTzS1XEKQ7XgAp8s4WpUIHPGH8m18gUfwYmjL1UrWNodQA
	CNZLo=
X-Received: by 2002:a05:620a:3713:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cb408f71a8mr2233847285a.8.1771598209798;
        Fri, 20 Feb 2026 06:36:49 -0800 (PST)
X-Received: by 2002:a05:620a:3713:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cb408f71a8mr2233844485a.8.1771598209355;
        Fri, 20 Feb 2026 06:36:49 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm691030866b.57.2026.02.20.06.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 06:36:48 -0800 (PST)
Message-ID: <d1f9ae01-a81a-4287-9f98-f2318ec6dd01@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 15:36:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Add camera clock controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com>
 <13553877-a4d0-47ad-88ce-3d4d5b353101@oss.qualcomm.com>
 <c8e9eb0c-9c49-401d-ae4e-21dcb1e1e843@oss.qualcomm.com>
 <a39f5526-8727-4fb6-9a93-36f412b93f88@oss.qualcomm.com>
 <00a1e492-1235-4dfe-ba0c-b1cb7c43ae22@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <00a1e492-1235-4dfe-ba0c-b1cb7c43ae22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _El464trQN29qNcfnmnz-CIYJINu9zjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDEyNyBTYWx0ZWRfX84J29/G1D1a9
 9GhLLKYxiu0sL+4qBWO4kUNqojmVUVEbpEUiEJXYT7E0QTwtyuSwMjdaoEJder800RAPCBb5fHq
 PVEsLcYkW0ELvzJwwUpKpVlNfy9C1TOIDEEVdbd6v2dqw9PpyZflQVw5SHGCsxCTXuuLokQeIuW
 CLOgap35duc1++2rqIdARle2tIMGE831ahbZ0g1NJfTR9W0sbV5maZxB81VffyOBh41eFl4mlDt
 LXgQVT8nltnNke4Gi7frHFN6f6m1AcswtX4OFMnVDVvrlHZvhjHxOZTcUzRzVUPW/2v4Rd5rucS
 2mgI9NCz3dG+jioXX3cguiY7mWgwtwF6WgLJtyIazEOnJ+7kn8wdKS8UNbpB6odExRfPOIWZKQe
 FpPcfAnadTomD4cD5e4ZmdTDYnkhemGN51aV6QV2gS6Ts1PtutE2KUqTvliwZJATjmhYH/Vh9mx
 TCgGmYZytlqICN1oFdg==
X-Authority-Analysis: v=2.4 cv=PcTyRyhd c=1 sm=1 tr=0 ts=69987182 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=OnNOMOsO3_7Dkr8-JnMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _El464trQN29qNcfnmnz-CIYJINu9zjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-93513-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4478D1687BC
X-Rspamd-Action: no action

On 2/20/26 3:28 PM, Taniya Das wrote:
> 
> 
> On 2/20/2026 7:55 PM, Konrad Dybcio wrote:
>> On 2/20/26 3:23 PM, Taniya Das wrote:
>>>
>>>
>>> On 2/20/2026 4:25 PM, Konrad Dybcio wrote:
>>>> On 2/20/26 11:28 AM, Taniya Das wrote:
>>>>> The camera clock controller is split into cambistmclk and camcc. The
>>>>> cambist clock controller handles the mclks and the rest of the clocks of
>>>>> camera are part of the camcc clock controller.
>>>>> Add the camcc clock controller device node for SM8750 SoC.
>>>>>
>>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Update the MxC phandle to use MX for camcc node.
>>>>
>>>> My point was that both MXC and MXA are used
>>>>
>>>
>>> My bad, even I think I got confused with this. We really do not need MxA
>>> voting as it is always ON. We can sustain with MxC only.
>>
>> Does that mean we don't even need any particular RPMH level on MxA
>> for this usecase, just for it to be on (which as you said it always is)?
> 
> Particularly for this usecase you do not need.

Thanks for tracking this down

Konrad

