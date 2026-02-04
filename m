Return-Path: <linux-arm-msm+bounces-91775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bqYvEKjfgmlndwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:56:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 507FDE2256
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B61513007AC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 05:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEE434C981;
	Wed,  4 Feb 2026 05:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TarKFngG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="enkrxz7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67B33590BE
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 05:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770184611; cv=none; b=Lv9Ks6eov9njR30/9miKUsMC0OkdIYptwkFFVfveUiE1/HETFxEZwpYo+rCDxaVw5oB0W5v51uBr9lXIwxQNyWESpNEvKouvpmjcV/Ai5G2QK88JxOtrNWkVM5Pyx9NuQ6hV4dza8iyzEGv4PbG6ToeGhB0mRdqthTGBFmhbRBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770184611; c=relaxed/simple;
	bh=zoyChqg2V/ojKowxdKW7PXyV0+oFY0jcVoQ44lNcg1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYK5DlJmX/ijz9DZwB9kva7dY8GjAXRND9lhc8LOfADg8WpuVDSGBNe7nus3GSfV1rwT5VAOS+rxjHCCv2QW8H6wu9MW7PymT35KMFTyCfegx4LIhOFaG8aBkOvoB6YJM8elmxUthi9lyNtSrzgI99OHbcbDXO1KNb9f6v9a/ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TarKFngG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=enkrxz7K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6144DWKu2613570
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 05:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EK/ShqajA0Vgfe5o7lp0B84FnBvMS19l8JN+NXXxTfk=; b=TarKFngGx4Tr3o2N
	uO20VPqa1Ee/T4EbVQas86LjJqqVTsZE9pjB2PF1KfN2b/9Z5jkPpLdRZfEeSJhC
	ngk+c30ERtkr3Iaat2cTKhTKyJ1+8aOUJm7PfK+dJqRlL8+8NKscngUXwFi2urlD
	2jXh4E8VpGdX54ygWX2/0cNDtnLAJ/ScRvsE1Z9fiW2BYFJtFGD7SaU6Sjt1urYP
	c9PE0JjaNO3gufrdv2P33boewTPivUElBIZry/C09EZGL4nUEhzMfbzGARBpJ5s+
	Hsm1dDuTy/qR50ny9zx9sx1XfGUaKZzxIZKqi3smei2qoAZDKZKFyuCq2l3ehylU
	5IUiZA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3h07k4gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:56:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b724ff60e6so6914741eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 21:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770184610; x=1770789410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EK/ShqajA0Vgfe5o7lp0B84FnBvMS19l8JN+NXXxTfk=;
        b=enkrxz7KzrXOJ2SGl3wbyEU5rlhjpfOUWTLeoXZV9LAqnyYFb/neHyUurEgi6UiUWE
         WTw88eKpBkMczI7Io9zD51QrnIs2bsIQetcrpLNIIZjdOj9hRtjw43AiD/XtMV01VxEf
         RuCwr+FCGWN+Yta8c28/W2oxfRQFmpW0dxQFDQOHV2yDmIimPO4COVaPSEwdT70Itaio
         uBkFCBhhe6ATF8E4ppl+eedYtUZ0SUluUaAJqbe33ffBL16if3Ap8wr2Csdwc7GKSly4
         5/N/nKClf3pteY971efO74sJNLVomHfxzJP+da1+l11FTRRmryAsL2OFGLRRvleNUB9t
         L8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770184610; x=1770789410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EK/ShqajA0Vgfe5o7lp0B84FnBvMS19l8JN+NXXxTfk=;
        b=fJpDOgLTj4n8ktHsd5oaeVnPHp/Qp9bFuUZJh/FDSGOHaCBjcxOVCBWrbfVIbUza+F
         Pt9wdOy7py+JwzTMjXMy3Mkw5irUCQewA1jIH89FtYYV9hLedEHEfXuhB+azzyNSWP0a
         AhRr6v9MGObDgt+vJS/+6ksCPbVinf5zNDJ/MmdNaZaKa6hmnw+TF1AJoxWbS+MNBa3n
         GAi2QKYuw8oJm+Dg3NFHlWrCl20Cm+rYCExGQGKDc6Bdftybra/Ukmq7TMNHZEy5/8Ha
         uWJus2W+WkJMimqJnM/MsK+mIshnVj424mQT7f3Wo961eCuRpVu3hcKe4AHcbeTrKlOa
         49tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGTLJpi9cDue/sbItccEIpebmGG5688D/FosXy/1Zj+nlqVzdKN6pR16ogqFM89TGY1dv1Y9W0EFfsxYF9@vger.kernel.org
X-Gm-Message-State: AOJu0Yycyc/JUw6m47ThbPA947T0mxNkiPVVTeCK3hgk7LXpqVTlZ2p8
	DTcFuEPxeCg/jZZo1P7GlHmM8AdH7FFDQFGGwZPHUmIkFf+gWO0j2XQkJpQ27S8AF2SyJajZK71
	CqrnGuwneoP8Feuedp1HPguysTrbhwnmumx6FCDWCJRjB7sQI39Zj6ZphU2MjznT1f9eo
X-Gm-Gg: AZuq6aKJUyFc6V3/FUdsGr1potlM/MZYL+dpMWN0ls7bYlckHj34HPuJFOu+mrNCqko
	9ubBSjSK150S5EGUsqNuJAaS3UR3/2NowD2jPOa07c+5eOtAuGUaJpaHe5/zdyjQfRLBd08gJOe
	T8FJTpUGSCnjr6E4iGBXDgoMDIu0ijAFs4Aadl2MFZVacVmBs+u2GoYaE/LRsc20uo36WcSAGox
	38H/kcogc6hdCtXwa/kOkmhPrq2Qh5mZoVNH1xvMlllfJOaLBazUFj9aGvtc/HxqfIuA/LJ8wAY
	UsHcPBxQCKYy++h5/AjH3Z59fqBaFNjkYZNOiA4zlidKQIJboIjfo58OCpJVHO87CwPYVJ0N3kd
	Qc67jAftEsXVeySt/+AB5ViLH50SmxbkzxUFZgKhUMikfmg==
X-Received: by 2002:a05:7300:534f:b0:2b7:f145:a9c with SMTP id 5a478bee46e88-2b832a234ebmr747645eec.34.1770184609955;
        Tue, 03 Feb 2026 21:56:49 -0800 (PST)
X-Received: by 2002:a05:7300:534f:b0:2b7:f145:a9c with SMTP id 5a478bee46e88-2b832a234ebmr747634eec.34.1770184609345;
        Tue, 03 Feb 2026 21:56:49 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503ea14sm1379676c88.16.2026.02.03.21.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:56:48 -0800 (PST)
Message-ID: <6a982b56-2f4c-441f-acf7-a8e77ea55600@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 11:26:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd
 <swboyd@chromium.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-5-swati.agarwal@oss.qualcomm.com>
 <63fjxtcmpbpna4cuuis332y3p52b6pvh43gyg6m7u5kiwkb2pb@znwfyet4xlpc>
 <CAHz4bYuR_LZXh=tS2FJ4VE9tVB6vN10pd-9i=uOL35sSx_BRzg@mail.gmail.com>
 <fycr33dqcosay7ake3nbbeaclhqvynwzixas4u3ocaerpqbu5e@shoibdd663vm>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <fycr33dqcosay7ake3nbbeaclhqvynwzixas4u3ocaerpqbu5e@shoibdd663vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA0MiBTYWx0ZWRfX351V39kVu00i
 z041KD8S00fauyMppW5Id2/scfos4q9Dyoekx0cbjou3dNgX2NYS/eK5F93Vw3Nv4grPuqGjT+q
 HqJEd3i1HLFKpvoE/rjHVq7XtwVxEufenCWwTTI/gtquzSYNXbhmlDGTcIr5s7lV9QXzjVLw6sM
 np42OyGHKUIZhKfZyZ7nm7BraS3pW7zFPkuCuD7ZEv32siQA4P4Rx+62x5/3rJNTCY3Rgl0lpvW
 X7YXirwgUAwMfro7ZyyIpawJuLQ2ii0HEwP34zc2KYkOOOBg0VQ+vkyDCkwEdzUHPZ2FL/tB17j
 /9tRIdjsoKhwr6cLKP5bu9xGT30ysy31zjMJMbhO64Yzfc95J+zs+AC8T6r0oJZFp01yQws7lNf
 ECy2+DXnPlSd5gQOcH7+CkQTMuw2U3g0GbIm6qSW9kVFE1XeFkHcfu9sNrcHNGVkAwlROl7Z7a4
 P5YSaVJsW4vF6DY2M5A==
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=6982dfa2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bWLVWEuH_CVqUnXyZ6EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: cpnAPeWTvfk5F5MA4TW41NzRW2w8_YqP
X-Proofpoint-GUID: cpnAPeWTvfk5F5MA4TW41NzRW2w8_YqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91775-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.2:email,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.47:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 507FDE2256
X-Rspamd-Action: no action



On 2/4/2026 7:03 AM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 10:53:46AM +0530, Swati Agarwal wrote:
>> On Thu, Jan 22, 2026 at 4:02 PM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> On Thu, Jan 22, 2026 at 02:58:52PM +0530, Swati Agarwal wrote:
>>>> Enable secondary USB controller in host mode on lemans EVK Platform.
>>>>
>>>> Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
>>>> having 4 ports. The ports of hub that are present on lemans EVK standalone
>>>> board are used as follows:-
>>>> 1) port-1 is connected to HD3SS3220 Type-C port controller.
>>>> 2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
>>>> for Bluetooth. This port is to be used only if user optionally replaces the
>>>> WiFi card with the NFA765 chip which uses USB for Bluetooth.
>>>>
>>>> Remaining 2 ports will become functional when the interface plus mezzanine
>>>> board is stacked on top of corekit:
>>>>
>>>> 3) port-2 is connected to another hub which is present on the mezz through
>>>> which 4 type-A ports are connected.
>>>> 4) port-3 is used for the M.2 B key for a 5G card when the mezz is
>>>> connected.
>>>>
>>>> Mark the second USB controller as host only capable and add the HD3SS3220
>>>> Type-C port controller along with Type-c connector for controlling vbus
>>>> supply.
>>>>
>>>> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/lemans-evk.dts | 208 ++++++++++++++++++++++++
>>>>   1 file changed, 208 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> index 074a1edd0334..a549f7fe53a1 100644
>>>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> @@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
>>>>                };
>>>>        };
>>>>
>>>> +     connector-1 {
>>>> +             compatible = "usb-c-connector";
>>>> +             label = "USB1-Type-C";
>>>> +             data-role = "host";
>>>> +             power-role = "source";
>>>> +
>>>> +             vbus-supply = <&vbus_supply_regulator_1>;
>>>> +
>>>> +             ports {
>>>> +                     #address-cells = <1>;
>>>> +                     #size-cells = <0>;
>>>> +
>>>> +                     port@0 {
>>>> +                             reg = <0>;
>>>> +
>>>> +                             usb1_con_ss_ep: endpoint {
>>>
>>> This contradicts USB-C connector bindings. Why?
>>>
>>>> +                                     remote-endpoint = <&hd3ss3220_1_in_ep>;
>>>> +                             };
>>>> +                     };
>>>> +
>>>> +                     port@1 {
>>>> +                             reg = <1>;
>>>> +
>>>> +                             usb1_hs_in: endpoint {
>>>> +                                     remote-endpoint = <&usb_hub_2_1>;
>>>> +                             };
>>>> +
>>>> +                     };
>>>> +
>>>> +                     port@2 {
>>>> +                             reg = <2>;
>>>> +
>>>> +                             usb1_ss_in: endpoint {
>>>
>>> port@2 is for the SBU signals. It can't be connected to the hub.
>>>
>>>> +                                     remote-endpoint = <&usb_hub_3_1>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>>        edp0-connector {
>>>>                compatible = "dp-connector";
>>>>                label = "EDP0";
>>>> @@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
>>>>                enable-active-high;
>>>>        };
>>>>
>>>> +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
>>>> +             compatible = "regulator-fixed";
>>>> +             regulator-name = "vbus_supply_1";
>>>> +             gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
>>>> +             regulator-min-microvolt = <5000000>;
>>>> +             regulator-max-microvolt = <5000000>;
>>>> +             regulator-boot-on;
>>>> +             enable-active-high;
>>>> +     };
>>>> +
>>>>        vmmc_sdc: regulator-vmmc-sdc {
>>>>                compatible = "regulator-fixed";
>>>>
>>>> @@ -536,6 +585,39 @@ hd3ss3220_0_out_ep: endpoint {
>>>>                        };
>>>>                };
>>>>        };
>>>> +
>>>> +     usb-typec@47 {
>>>> +             compatible = "ti,hd3ss3220";
>>>> +             reg = <0x47>;
>>>> +
>>>> +             interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
>>>> +
>>>> +             id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
>>>> +
>>>> +             pinctrl-0 = <&usb1_id>, <&usb1_intr>;
>>>> +             pinctrl-names = "default";
>>>> +
>>>> +             ports {
>>>> +                     #address-cells = <1>;
>>>> +                     #size-cells = <0>;
>>>> +
>>>> +                     port@0 {
>>>> +                             reg = <0>;
>>>> +
>>>> +                             hd3ss3220_1_in_ep: endpoint {
>>>> +                                     remote-endpoint = <&usb1_con_ss_ep>;
>>>> +                             };
>>>> +                     };
>>>> +
>>>> +                     port@1 {
>>>> +                             reg = <1>;
>>>> +
>>>> +                             hd3ss3220_1_out_ep: endpoint {
>>>> +                             };
>>>
>>> Why is this port disconnected? It it really N/C?
>>
>> Hi Dmitry,
>>
>> Sorry for the confusion, Can we do it as follows:
>>
>> hub:                    Hd3ss3220   typec-connector
>>
>> usb_hub_2_1 <-> port@1       port@1 <-> empty
>> usb_hub_3_1 <-> port@2       port@2 <-> <empty>
>>                               port@0 <-> port@0
>>
> 
> You still missed the _why_. Why port@1 of HD3SS3220 is not connected?
> 

There are no remote endpoints added in dwc3 node. Since we are making 
dr_mode host. Hence keeping this remore endpoint empty.

Regards,
Krishna,

