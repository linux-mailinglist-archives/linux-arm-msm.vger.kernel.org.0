Return-Path: <linux-arm-msm+bounces-95849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF6uI7vrqmlxYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:59:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E080223380
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04473301FC89
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E6E3A5E96;
	Fri,  6 Mar 2026 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hrc4pvpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3yK5Vzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B673ACA4B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809068; cv=none; b=qAxEcsqpuFNj5WEfKnqqeYonuwVTURoC/7xIYIi89puh1Pb2SJ/iiHEJy1ZXnTrfhMVUTJJIGkf+Kur0hu/aa8edgiY6r1vxiVklIz3fMjPkH8umfMDmZVRxLdXu5sDcKXU6Whd0a0RY61htOmlpdvgYMxqjmNeeu1r8+RCvW9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809068; c=relaxed/simple;
	bh=xBZTJgf06uCCuEEDLG6TKhtW/SbYasQgQdMoCjV2exw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJeR/zbyrCDbHZJb9Oc/1jz4gmAqSgz0K0zySWsj+viN0S/EwMs9Cz3h5jPfkc10eID2zd+ySRqzIRC05AYvT8/t3gkMZA6hV8NDCeNc53S1ticQlpU1wrMmYsJtOxgsiynF2UoT7UjlhjQ5G8sSSZAepULMUw0KlX/gB3roKhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hrc4pvpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3yK5Vzm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BcFCa631290
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cz3OwQgqvLLNFn7ypyj4owNUYfZ/fsaAqU2Y2vb8Dlw=; b=hrc4pvpDOI7IjsgI
	nzvwRKIkkC/svedMYWD3Y1/AH6xJzKNOupEi9Rg3a6gycaKUsrnQ9wr1jXaTHUOO
	K8u5sToHH2ce+12t92X2IAdwaHpJUzKh8zzOb2LgtusZaWNmcbpTNR0FBYR7mEJu
	aarg5Jeut9twxCJ8iVZ87x5UqvaXIGkU8OFuRsFRQ0ngGlaTkW/rF9nCNeB0K1wS
	6thTeoFmWyA7QsuR1lg95xzIyaEeWQuzNQYtC+8W2tNDwgn/kdNtItpjP9VeJFX0
	56s6u5CFFB1xI+i6Ipx9IM0Mn5n2GZougyjMcbX1cJ25WmttM6Qz4OL+F/jYwr49
	XAeEEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4sb2fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:57:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae44db60c2so59718675ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772809065; x=1773413865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cz3OwQgqvLLNFn7ypyj4owNUYfZ/fsaAqU2Y2vb8Dlw=;
        b=W3yK5VzmCjTBtnCTJsU809Li7xUEEQI/VfE1dfT9HIqXmo+78tM47jeSs5J5mMx0YI
         nqpCplbTBKuUd7tYzOrxmJEUMhvZ4eG8VpP2CSxn4IXtvu2OGbzhdE0bGQ4d9R61IVLT
         GZBGjbT3uMBjdriG4ISVXM3kmYE0hiuiz4VeglgrFua2J0keiAArHHosOrVSHv69sio5
         e1EkN5m4m7vhyfQ5O3TJiE4T+YWi3VcGtvqW8Pxgmfd/1J2ufzLm7OSSjIBW9EF+2zXI
         Mxhz+CCSSL3Vi3FdY2jIzsBJy0/a8GI4GB2eOJW1NDhDe++17PlyxnmAYof+N5Ciq74S
         wldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809065; x=1773413865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cz3OwQgqvLLNFn7ypyj4owNUYfZ/fsaAqU2Y2vb8Dlw=;
        b=tXx2bJEbalsTp/ONDtydiAlHak4U6ZsQnZvpYiYy4DEwJp3mhj/rbKzZsK4MPZABPl
         NXYdhFyPRHTRhnnygh52am8Cx/cmAhjxM2uuuzpdc+9ZL1wf0i4xsxJLdAHcVBwcBvkR
         74bysqkTR4Fpusj7zJVxEZ15uIT95Lv7xktSKAxwTBjjIN4qTQvKt3z77r7Uxze2PlBp
         cdi4Guy4M4I3zob+Pcxr7YHz/qiJ0CphsQeZB5w4b4mxXfkmhZRDoQu8gq0FbZUsUArV
         A0AZlLpz/f75ElvMYQJle+ARH914ZLAHfkLnth8Fncu2r3d69TcQY9V19NEs/q7Ga4NZ
         6dmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUosjnxJn6HcsfvEnhQ4V52p9QrXFHMFZSjlPuTEtJFHb1YzIi1r4uHCr0H+PRxrIaqOFmKRsSWAcjCnB6z@vger.kernel.org
X-Gm-Message-State: AOJu0YxZIxR9gA/NNybsDnBP+urBLs7f7PTqLxDFNxu2E2oEOxmit/jy
	W+/GobcUVSSav4cO2c4mpNFSPJQhAr4vUWmPGqUn9RMs8zA++suMotMpDrU0MImcuDnkJZq7fE5
	k4Z/kTNlNhuaXLcvbMq35hfBgHlTPN+gBl9MpOYkYKtAa4vZFgXABVisFaeHJ3dhCDrxX
X-Gm-Gg: ATEYQzzLmza5JDqESSp/ftwB4xtrjGH/EPzeciGCli/W+m9PvQIPayUin72VmLLYher
	m03yju6RnPFVR/oFJuVWSYSeEXjLASYShDcIHAPNGPYepklq9TyQRZtXm1YwpETvnXh+EfrXM+E
	ZmjrwIOg20apPmVXdRkphdC71uIvDIk+7WsVcxIJNh06sp+iM9aT78oAsgI8kzVldLMIYSNNivs
	wRqd0aoRUsbYX56/fZfw4FUFjOulCr53f8fFtZnQ2BhKqs3DYZY4BotEVPpr/OeuyIh7+krjYqE
	3cE9J3UtVPG0VK49z+I4gmc6iBXtxBPy83VS3U15bFHLEynL7gEPeQXW/C3bja1hvG9Rl+/xlqL
	UUW8LhXUbWfZE12LvSPingCshjJzjdLdOSKtA4TqCiImvdkZLTCnFtOob6DtSRvm7Has5Icn4aA
	9Qp3S7TdbX7K8=
X-Received: by 2002:a17:90b:4c09:b0:359:dd9:3de5 with SMTP id 98e67ed59e1d1-359be238c5dmr2079124a91.4.1772809065172;
        Fri, 06 Mar 2026 06:57:45 -0800 (PST)
X-Received: by 2002:a17:90b:4c09:b0:359:dd9:3de5 with SMTP id 98e67ed59e1d1-359be238c5dmr2079088a91.4.1772809064580;
        Fri, 06 Mar 2026 06:57:44 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbc060d7sm1328627a91.2.2026.03.06.06.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:57:44 -0800 (PST)
Message-ID: <6bcf3d43-030b-4607-9cc7-d347348aaffc@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:27:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-5-dbbd2d258bd6@oss.qualcomm.com>
 <2byedzh5w6ymnoebve74a2a7oezgich25wdh4pdsqmvv3jvpkf@kyk2gz5khibe>
 <2f1bdd7a-04a0-49a7-b275-4332f2979378@linaro.org>
 <a7e8d1ae-63cb-40ea-8d59-aa168b104748@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <a7e8d1ae-63cb-40ea-8d59-aa168b104748@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfX3ZFFZvGeITaK
 XyFYthoJE7dkkQvyExO51CJ8vDQpBuQhQLBH8VsKxZFqXFQq1y2K0F3w0LrZvls9fhpY/Nbptfj
 2g7yXsmY9AUDXtOYO/Ao7IeqnVzXZ/teYUUHcdlBR6vKYd8Ar3qfKCB+z+1ciICk75YkXm+3QOE
 d7oJjfdOlYSZIM0qFnc4MVizUqwbim1ZJqR0K+HwV/kr0ZQHEFxorTV0cyzpNGzpi8tISjqBnjU
 cazgQV2uHpGOcdFTB/dZ4ukYBMGQGdGWWL5MRok9h2XX8fAf2krS+jFYtz9RgC0zZeAbtWB8vrE
 ttdl+Eqr3TbCxT9QiFObi38YiBxQoM/fwdVuZoIWpzki7PEnupl3tW27BjtY4qRuQi6fZUVjpZd
 b6Rmms+mgIgoM7Du+U97+w6igz1IaDsP4HhJbaVCXt4qJ3OSpkDW+oDwwzHgcYuO1L23dPA09sC
 +Do0FPofx6HlKTydKMg==
X-Proofpoint-ORIG-GUID: XjOnggVMguFTOAeubfgkkid7ks4flGNC
X-Proofpoint-GUID: XjOnggVMguFTOAeubfgkkid7ks4flGNC
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aaeb6a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=C-5xYsbyb9TDfLoqzDsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060143
X-Rspamd-Queue-Id: 0E080223380
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-95849-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/5/2026 2:35 PM, Konrad Dybcio wrote:
> On 3/5/26 3:18 AM, Bryan O'Donoghue wrote:
>> On 05/03/2026 00:33, Dmitry Baryshkov wrote:
>>> I've cross-checked this against X1E80100 driver. The main changes are a
>>> drop of IFE_1, SPE_0, and two PLLs. However it also:

>>> - uses hw_clk_ctrl for several clocks
>>> - uses rcg2_shared_ops instead of rcg2_ops for several clocks

Above 2 are safe to have recommendations from HW.

>>> - uses hwcg_reg and BRANCH_HALT_VOTED for cam_cc_camnoc_axi_nrt_clk

>>> - uses HW_CTRL_TRIGGER for cam_cc_bps_gdsc and cam_cc_ipe_0_gdsc

These 2 GDSC's have support for HW control mode, so added this flag and
consumer drivers can switch to HW control mode based on their requirement.

>>> - uses non-AO clock for cam_cc_xo_clk_src
>>>

Both XO or non-AO should be fine here. Ideally if CC has any clocks with
CLK_IS_CRITICAL flag, then AO parenting is required to allow XO low power modes.


>>> Are all these changes expected? Are any of them also applicable to X1E?
>>>
>>> At this point, I'm torn between suggesting the merge of this driver into
>>> X1E driver and ack'ing the current form.
>>
>> We can test the diff but, I'm not sure that will really answer the question if it is the right-thing-to-do.
>>
>> OTOH if it ain't broke, don't fix it.
>>
>> Reverse the question - is there any reason to have this driver at all ? Can the x1e CAMCC be used as-is ?
>>
>> If not, then we can accept this patch and potentially look at merging the two drivers later on.
>>
>> I assume the code submitted has a purpose though i.e. its not possible to just use Hamoa and Purwa interchangably.
>>
>> A few community members showed me CAMSS working on Purwa last year in Amsterdam with the x1e code - one error if I recall was a clock splat.
>>
>> So superficially it adds up to me that its not a 1:1 thing with these two parts.
> 
> The difference between 'can/does it work in some simple use case' vs 'is it
> correct' is that the exact match for clock configurations between H and P
> is (according to the computer) 4 clocks (out of 200+ in the camcc topology).
> 
> Most of the changes are small differences in frequency steps or which PLL
> is used for a given OPP etc, which ends up being small in the Linux
> representation of that data since many of the freq tables are reused 3, 4,
> 5 times and many clocks (branches) don't even feature one.
> 
> I would imagine almost all of the points raised by Dmitry probably apply
> (but I'll let the people in the know comment on that), which would greatly
> reduce the effective diff. If they do, the drivers could indeed be merged
> since the delta would be just those couple freq tables and NULLifying 13
> clocks on Purwa
> 

There is frequency table delta for most RCG's since Hamoa has an extra LowSVS_D1 corner,
but along with that, few frequencies like 480MHz for cam_cc_icp_clk_src...etc is derived
from PLL8 on Hamoa, but the same is derived from PLL6 on Purwa. 

To handle above, change is required in cam_cc_parent_map_0, cam_cc_parent_data_0 structures
from X1E and these structures are used by many RCG's and all those RCG's also needs to be
updated, so overall it is significant delta and hence it is good to have this separate driver.

Thanks,
Jagadeesh  



