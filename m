Return-Path: <linux-arm-msm+bounces-108164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKcJC5jxCmpv+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:01:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3831E56B243
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1447930EABE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1193EAC89;
	Mon, 18 May 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKiYZplq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHpCC7yq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805F392802
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101045; cv=none; b=P80cvdQH6Yf7XES2alJ7pvTRlTonQTDw0eFI8yxwuTWtNkeBvIzAiJ1UAX5U6mqdOQ0t5ZCvVKBRBwHJKaHFurewEVb+QipQtS2HTBOeniP62K4B4a5+t06DntKOw4gE+HCQUOvSdEgS6CAmZbuR3cxKBM4UxVPIRTyqV2TK5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101045; c=relaxed/simple;
	bh=l4ToQiBwy7d2RiY785WIbdxmKwkLErG4Ylcah7yaaio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHmYzBWXNAcgZ1QVf/suYlk9M1z4L1tohiW5RWB0mkwb0vw57G3fyWAryyyhofp7h721kYAUgIl1d07ShEJ/RMFf4P2y7o9PI/vJM4bhFofcc3KMl0NMCNjFjAt772X0wFIUhEGCo42wWwBbgsKTwe9k7crFV1AbYQ1xy+SZGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKiYZplq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHpCC7yq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7G4tF741446
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8g9fIrkR3zBA+xoNE5AMzZclMhUkHCRBwnPd3MLibI=; b=YKiYZplqwD5mfco2
	opUgOviuILxcrzdiuTJw9V1Ri+2HhvzQXFHGcX/+9htSm57bmqAaN1PefKhHnCR+
	IXgxtbDEw/pUJVLr69oF+epYfftz1W5FkWuppkV88m1RcV9B3RObNUwFCE9CrZKZ
	ZrqwMkylCcEaZIHlTWyuBkzqMLCwxZJt29d6F8g3nYbBvLCKC5VlmMN+grEF6f0s
	vc+OpXGqd3hT2ncCcJn2XR0ij/s7NgtEadao4FupQL3SbK6RYZa8kLBUoyVJKZED
	tow+7R36WOKv7bFHvrp6MxyF5JdrHEvDnRk9k0ezv5EKG/1h1Eq3GeLUJ6QCZRQt
	vJkfbg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcmw77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:43:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c828659ecd4so895144a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779101030; x=1779705830; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8g9fIrkR3zBA+xoNE5AMzZclMhUkHCRBwnPd3MLibI=;
        b=AHpCC7yqbAWfRMIdEnZbuhaAao4XbW/UfMLJu7fe58eO/6u6FumxRKeQh+jaT0AX8L
         BVV5I0fHvAlSmaQ+uqiEEKbzJm3m8Bxj1Cpovaz9UDUsa08A2Z5AbdkVFl0FDRvSgUGq
         HSAM5xtOTQddcsI+umT3UZ6Jl3PELtmbDzz2I0k1+XN07w3eFaCvOm2EakZLbkNKVHKO
         VqzKeyAO06t/89wvxbqp/MP6XdY8AjFVr4j6skyLn1m3s9IOatZVzd5eMzwzpTu4mGGj
         q+GcXZJs3w0rLrdpJNdXXEnAy+YOPGNC+BSv5/62KMh9LsEClKNSiWlfUvKcG31qHLQM
         y2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101030; x=1779705830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8g9fIrkR3zBA+xoNE5AMzZclMhUkHCRBwnPd3MLibI=;
        b=J9FKX6iTkEgOQVtT17YRB06V4U4be4pdpil/17WkGwyxSIkQKFhVDjxjhpiGjyFQWe
         sH0hhGZN9pQLYGdPrfmWxxy353MWLfgbvn29EIF7ViLR5aqy7u1ljJDXsMoSvHTupBXA
         jh1LKAv6IwZM5Pen7iA5sUxNlSIWi1cu+vER1Ydkf5SN1+1lOgzJT31QqWhTDP3t31tL
         uhmxoNJV+knJt6UAtIns9tEMUPCLmmTQbwkGNacgTacK5CXqq3UVHVGEVWq104dncjqT
         17glOcqFqzSivhznkTdGawv46dmvTjn2WoI3fiCTI0xPrOE7GyqywP015jPJhE2gQDz6
         Ig3g==
X-Forwarded-Encrypted: i=1; AFNElJ/ymqZFInaOf8fcqG5EcG0btIQNSQ0hhAZXpX/5pWEZWti0G10Dq5ODEX4vUShvy3IN7fCms75NdSbkc85H@vger.kernel.org
X-Gm-Message-State: AOJu0YxL42hoIHmd1s0QYfVb2sKDS8Y8lTLycvk1043SmZGq0mIBCo0E
	0QQvmW+zY/pCDzcJnKJOAZT/Vm+1DJlgP509jFn4q54BvrYaFuZlTq6aR5UhU6fblgpnwzb7v3J
	xU1gmYffOXg5+W21G+xyXU+qc5ZvGQjB8AgBPuQSlT/1Z1iLHgwcNEOI/PMdfX0gzZDPL
X-Gm-Gg: Acq92OFB1V44J6hzsgYtgEXN4Vszs4CNhYAJ5eQ2ocbJp8/NO1NuU5XYR8GOeGUli2I
	jINWk5sj76+QPv5bJj5jCiWFPOfie/z2MxaL1kmrBNyekMaD57llnzLhMUGhFQfTQltm2w0MyuE
	PmpFUbq4RyjDtjB9kE498IsNnB3X+R56qvbAHunfNMgNrKlhivOA9AjWbQ8eDPDNQVq9AeF2HIx
	bqzAUK/1S+3grmbLkYQ9R3kCwKzd2rFuJbxmT/SF42+TBxedX8fpILElMpoInsOq0EGfV2Be9uF
	NvWoFkBg3I9RElTC8HTj+1Od1ISmqrJe6pqLscURov8e/hij5URqRDvGqhChtXI56SwGVdiw5Ny
	5Lm2xfyf9QATwBwuld+Y2zvBaO2dHzp4lcfKLEUI3XZ39EF2ZJ5qr49OoD8tT3FhcPOumw4oXjw
	QHZuMoblny3sgMMEvOombTxAZTVHsoV5O979YyjxWPS8E+xuY=
X-Received: by 2002:a05:6a00:3915:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-83f33a38df2mr13901976b3a.0.1779101029696;
        Mon, 18 May 2026 03:43:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:3915:b0:81f:ac81:d597 with SMTP id d2e1a72fcca58-83f33a38df2mr13901956b3a.0.1779101029233;
        Mon, 18 May 2026 03:43:49 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5ce1fsm14182221b3a.35.2026.05.18.03.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 03:43:48 -0700 (PDT)
Message-ID: <734cf62b-e896-4089-8c8e-5b773ae7df5e@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:13:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <ac3i5MIlEQ6y9SNp@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <ac3i5MIlEQ6y9SNp@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fwSPoxARMVcm_dayP0VWOy7ds32LFnjI
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0aed66 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=k8rrXGyE-Y1bW8ej70EA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: fwSPoxARMVcm_dayP0VWOy7ds32LFnjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMiBTYWx0ZWRfXyMrHF68vR6jJ
 icd02WlVXBOjgGVEtRm21KfCkzNMEN3l8uo9/eW/nKNCiR94lACgHzBOwqoThDA1Et5F7yumGmX
 7VXA3uHNvE2/6EdshbS2SOZZZcxCGEe4amvZk1pd80AKORnfKfZ9IfJu0Ro93m8J3ZbBWZs37Uj
 1+1DdPIqHPkdX9DQ55W3AOOX7nQbIrgiU2ZHV6lodYiq+vSN8Bt7O7G1d/ooLZHagQnjZ6oJPlA
 sQoUJpEYol4JSMW2Zvpe2IKdRLCRcQ+BBNuQrd4hCSnxdljlxdtF1nZjWQm84CSGr/HHM9EN1hH
 NtksvrUUWqHL1rtYiMbqxiK+H+9p/7NQu4XRy89NVnWh5H26yNIF30fgAd0EZ831JSg84wwr7I+
 VbHiqyo/i2hkk2f/WtqFjt+mACYikykA70iMIj3Xf9ak2KvCEnXKCkW0txA5bLGdXKj/GRFNR1q
 PbzqBSu5ZkS7da9TsEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180102
X-Rspamd-Queue-Id: 3831E56B243
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108164-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 4/2/2026 9:00 AM, Shawn Guo wrote:
> On Thu, Mar 26, 2026 at 07:21:01AM -0700, Gopikrishna Garmidi wrote:
>> The display, peripherals (touchpad/touchscreen/keypad), usb and their
>> dependent device nodes are common to both Glymur and Mahua CRDs,
>> so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
>> reuse.
>>
>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> You may want to have glymur-crd on the subject prefix to tell the scope
> of the change.
Sure, will fix it in the next version.

Thanks,
Gopikrishna

