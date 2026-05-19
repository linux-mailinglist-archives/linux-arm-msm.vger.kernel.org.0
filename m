Return-Path: <linux-arm-msm+bounces-108467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO4+O8tFDGoGcwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:13:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E657D4A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 784A5309561D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3E847F2FF;
	Tue, 19 May 2026 10:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHWGZnTg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jw9DeTNx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4273F1AD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188295; cv=none; b=FTCIc4WnGHIKhkNYmqMzaXfSrF4ZLUEuyt7kV4z1bg61ZZOQ8PGfb0fUDBV9ldB8OfVt04LEOhuj3pWF1giFfPI3mlCzGKTcqLiVdFV0agY+FpLql9ZYG6CAN6th/pkHnCFigy7VYXoY5RHhgkyReRxjE8gCBfgRbFcvA2l1PcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188295; c=relaxed/simple;
	bh=ivr9ipTg24AkNx0uhFxVMcVmRDcV9XkgIZgCptTgJn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJXqb7PHNzQqNe8wW468mx3z3QHbAJcm57lOyB88ruRVAvLVzACeGYbqAzKD91R5k5zyxQlrMRI1u/57RAOl9XUe8bJ3mcWdFOirUui8f46+cLy4koljbm7knh4EQpkXdG4cnFo+/ZbmX6YAy2YXjoE4TUI5YXTC6xJjKNf92aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHWGZnTg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jw9DeTNx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vFuh1055038
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ivr9ipTg24AkNx0uhFxVMcVmRDcV9XkgIZgCptTgJn0=; b=kHWGZnTgt24P1dYQ
	5rF3LkhUQ9IFOSwjG/8+t8ftWHWM4LDIf+YfR3hWDbCEjgdevrqxRnB2DR8K++Ye
	1YHDAotxK/QOD8mfCgTb9ImQ5MeVNGwnohyb8i4u6UBkTGCFP4lEhssoaAg18mwQ
	LlTm+zgBWMpzRMfDyggWgL8FGjvyRE3DIb8KR2gi1GngK/OTymSrgUH6PrWe6FX7
	rRLNGPnXucuCYdK1BrxGeDJvg5npJdemhw4V3P9PsFTt5sizMyPO2lRRFqPAOWDr
	2nn+6DAlpqzQy463XYu4w5WWqeoNQraEMZqXFABAlunpQtkdBTTx9ZOmtF9S+u4R
	d0O3Fw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npar74s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:58:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so11616221cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779188290; x=1779793090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ivr9ipTg24AkNx0uhFxVMcVmRDcV9XkgIZgCptTgJn0=;
        b=Jw9DeTNx+4abzzqkJTHN+pZkvcY9pkc74udPPrP0LjIYZo7HmoeNXd2XrzOMo9bZED
         aRwavwEIZqcOc1NHCKl37zUfFLsW5RKbaB43SiQSPArYcvLJO0YjYADUhvBNYQoSzp6P
         auM0+BJiWgNekrD72eZZcCyVZBXrVhUn7ktpendLhr5bw5WmSC60WINnr6HsZGtmwkTF
         any+lQ036Mgm4bMI3cEmVshwWtBjyxoyT5sY68rIgNvaOFcKLIw+CmxMSedOW5q2+Op8
         HBNHyysnlF2irXtIKwpBVwUhJVvLUSuqpbn4Bkl0947zk3ZQN2uAmiVeSXDN/Zt3f1mH
         ugIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188290; x=1779793090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivr9ipTg24AkNx0uhFxVMcVmRDcV9XkgIZgCptTgJn0=;
        b=If47VG2rXrR+uKu0kR3bgcK0I08Ef8j7YVz0WmL8ihz57/opBmZn4NQ0zIWKkN4ZHs
         Bt04oMn3xDWJI15CQ99/+eEr5QFRjITDAizqdFqRjJc8OkJFAF1ytaOOKDHnQEafzIcr
         vJ7Fys5rvPgIsR4XPNBo5TcFHJC+09mvG0xlAb0cMqxSz9cypVOL/B9tlPf1Cu7R8zSJ
         IzrRmpZd9CmjQx7yoL/kXDFLEIS9DFsxeiSeCo2OyzBE1QG1hd33ruORMfirbEzJ3QYh
         DtOThJbU8+tOB2jQV2D+rgl9e60GKR4cBJw0bzqKrdUF0dHThEDB9FSkMMpEUWt+5GJw
         wwaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oxmCzwcgPU7Sr0T7G9eayiwJ1mSUs3vGN6Pd6BsLclnZjG4y7f9bv3lSdpJsPnrXglMHr5ZkQ4Tf4V4qL@vger.kernel.org
X-Gm-Message-State: AOJu0YzoDAwg7sNBUKYKegX5iwFyx9vw59oZidY1e9vUz5cVOj4c/ch/
	pB1YFzf+AvBnQBDJ8i8DQ0bmqeTXe2/bEUGDHO/Ud7Anx5vfhTehRvnJurbcZkHHTrVXNLHxVBi
	/dtxK+GdcukLz6BYT2qOLafYx6eGaKkGcdZQ1TdwD+otaIsvmO6u0URWsJ/QnqOz+SZcj
X-Gm-Gg: Acq92OFRUtUGbaB1xygu/92GItr9KHK+f91ierUTv78845RAZjM+s4LC0DoWrB3N9mt
	69R+7W+KJ0/Gf/17rVaukzdP0V/j/IZA56zjCMYmSgBCntKchig7tCyxZk0FhTUPKEKCVgKgdYe
	aBiNZ3sy1zhv2i26qEFU0CMgCywKET3WbKnKW6elSLyrZvzdgHWYNNqPMOQMG7PN7srs9WG21tA
	BmkL9NcTIGpo/KTtY9CfR1L03171NwtCq58JEzGOsWL9Pfh+zmLds7eF7djEj0kscxXkkP6zqRT
	O+ooihsGoOqZtu1qxTM27rm+fZA0wO9OP7wfpEnR3m6jr76wgJiHmWSaZAd47y6E/mmfyy7ZUj4
	QpgmmKbOlxdehC1khn0RvLhaKalIwglE9WFJ5tCjnbT1yGSJTQVT0SB3VJdElmO/g2d8HoDzxIk
	rJfaw=
X-Received: by 2002:ac8:58d5:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-5165a0dc373mr190342991cf.4.1779188290587;
        Tue, 19 May 2026 03:58:10 -0700 (PDT)
X-Received: by 2002:ac8:58d5:0:b0:50b:5286:f757 with SMTP id d75a77b69052e-5165a0dc373mr190342661cf.4.1779188290176;
        Tue, 19 May 2026 03:58:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c2a68dsm701110166b.18.2026.05.19.03.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:58:09 -0700 (PDT)
Message-ID: <91832aec-22f0-4244-9989-39bbd8defb24@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:58:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwOCBTYWx0ZWRfX1Zhz6UdDQIW6
 WYJVIyO/LRfzAadrgohzduQRKs2wLYFjb0Pp2X61n8WjuZA27/9CUrq+jSoxXb4TdEK5/8z3T4l
 HtgcB7+dQgGBLGdS8RcaernVdtqkzswecPTnZFUY4A2/AqoQta4tqPqIIZU5ezEFT8l3jzaGynl
 3MzF9NPm30pp/8ODUJjRSjb9v96s1Zk2Z1yYWsjn6DDBmtW1fo3R744yhWmi3cmG9T5d6XPsxTB
 lfeg8tuxQXJC3UEz59uz47WY+Oy7N5DBChZQfBWvLDawyh2pqyatBUC7WJmAFF8lflJYShkDCUJ
 EsvvWwqygyOhaWb8Dy/Gk7ov239eZJ51t29/lhDeJ2cFslX7y78MBUycIIKXlaTN8kV634wQ7xN
 sDBkkOnZoMVHot1KbMoL1QRdGs5xI+PpTFAWS2lbXijEVObgq1RnNTF3AdH/LUasYleTiEC36dA
 CNdwF6TD/jC4K/TzgIQ==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c4243 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=WGUvbcDy2-o6vtexG74A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 2Qe3uvZ5DY1_R8JnKK2Gw3DPOwEDbAlh
X-Proofpoint-ORIG-GUID: 2Qe3uvZ5DY1_R8JnKK2Gw3DPOwEDbAlh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108467-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 640E657D4A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 8:59 AM, Rakesh Kota wrote:
> On Mon, May 18, 2026 at 04:36:32PM +0200, Konrad Dybcio wrote:
>> On 5/18/26 3:49 PM, Rakesh Kota wrote:
>>> On batteryless boards powered by 12V DC adapters, registering the
>>> power supply as BATTERY causes userspace to incorrectly trigger
>>> battery power-saving sequences.
>>
>> Does battman really offer no way of differentiating whether a battery
>> is *actually* present in such cases?
>>
>> What boards are affected?
>>
> Currently, batteryless support is only implemented for the
> qcs6490-rb3gen2(Kodiak) board.

Does the firmware report anything obvious that would point to this not
being a battery, e.g. design_capacity = 0?

Konrad

