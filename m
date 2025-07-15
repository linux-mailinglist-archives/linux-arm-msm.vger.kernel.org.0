Return-Path: <linux-arm-msm+bounces-65091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD38B06731
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 21:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C28193A3735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 19:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55EA1B040D;
	Tue, 15 Jul 2025 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="K8ULZDaW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="U4vzUKCw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from send193.i.mail.ru (send193.i.mail.ru [95.163.59.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F74A11;
	Tue, 15 Jul 2025 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.59.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752608797; cv=none; b=OjQywv6ng2/mUPGWegU+ie7+S284TcfNiP0mmosQhXsfcynMq/NlHn3SQDddc9gkU8eovD/ld0g/jFYSGd0VfZv4qtC1o1H9Y9j8CW9jM9kA6lVJzVfwmJJ02PTS9EERsRir2Ve5bEr1g7fz7VcfJwoxPC3rtBjLBiRPAXxcjKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752608797; c=relaxed/simple;
	bh=uriLPZFWrENc8yflTjy8ePWfdB6HMb7cR57uabqn5Mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvU7VoqPnA+kA3pWA6H4qdnTWDJ3vQciSMurAJ/hQN49uxDhqT9GAbnWDGyT/7Q31h4qp3Zk0aQbPlCGRK4LTAlF+hfeKzVNSYUKxe1u5muC3ME8sI3OkCixrSeTBc8TtlTlfIKD3bsPPSfbfBZ1zpg+ULM6SjVPDd8GGUtGvSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=K8ULZDaW; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=U4vzUKCw; arc=none smtp.client-ip=95.163.59.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive:X-Cloud-Ids;
	bh=9cpHckK9vTd6XKFUTxpc3kFd/+B5gWZI5gFwoeANx9s=; t=1752608793; x=1752698793; 
	b=K8ULZDaWCbgTJt9SDsQ/IueUiqLjOHtcCX6yu0s4vQHc4NfTS3Da5Rp4MzFQdGCnrCfO90iE35s
	jAyaYJSSrTvUzIyC2llT1lpFOwfDaJteOHB0r/lVeDqo/dbke66Uz2TbFkmc1JhBVyuP/9eEQ5ebQ
	9uuesQqxaSVypL30yfA=;
Received: from [10.113.207.122] (port=49544 helo=send175.i.mail.ru)
	by exim-fallback-579c974f56-lgvqs with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1ublN1-00000000E66-49gK; Tue, 15 Jul 2025 22:31:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To
	:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=9cpHckK9vTd6XKFUTxpc3kFd/+B5gWZI5gFwoeANx9s=; t=1752607879; x=1752697879; 
	b=U4vzUKCwQj08UjuSp6nDZYPsOnQDLmcizt9PO/tlii3H6HENdHyqt8+ptNAurU4tdeQkPaTiE+N
	Cib+YwkiWl41OVlduLAyaHYMdJ6mXGYGAIxNW5vhKjqPXMfYL4SCgxE5andUA2Nu5e073LhPfsFdJ
	RrB9sEBnbX+msorhibc=;
Received: by exim-smtp-7bc47bf769-pszsj with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1ublMl-00000000Tsj-2qQN; Tue, 15 Jul 2025 22:31:04 +0300
Message-ID: <d56c65ef-c1f7-4429-a830-838c3256b9e2@jiaxyga.com>
Date: Tue, 15 Jul 2025 22:31:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop nonexistent
 hardware
To: Arseniy Velikanov <me@adomerle.pw>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Luka Panio <lukapanio@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250715185636.21758-1-me@adomerle.pw>
Content-Language: en-US
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <20250715185636.21758-1-me@adomerle.pw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailru-Src: smtp
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9CB0CA91FF61D77F029BAD425E6BCD2A540815A0B9AA3DF4D182A05F5380850404C228DA9ACA6FE2765C8FFB148CDD3883DE06ABAFEAF670599191CA46A8EBDC6D34000D822F1A4AB906DE0852CB23DE4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77F05ED334962579DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375666688F6781D70329C37EFBC3ABF54F2F87805CFBA3BF48F02ECCD69CB5BE86039389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0A29E2F051442AF778941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6E232F00D8D26902CA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCFE70A72D01850D713AA81AA40904B5D9CF19DD082D7633A0C84D3B47A649675F3AA81AA40904B5D98AA50765F7900637E14436AD9925526DD81D268191BDAD3D3666184CF4C3C14F3FC91FA280E0CE3D1A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FAE2BFB9A60527F4F42539A7722CA490CB5C8C57E37DE458BEDA766A37F9254B7
X-C1DE0DAB: 0D63561A33F958A5D14A109BADD487C85002B1117B3ED6966CABFDCE681DECB069995D676B7B4CBE823CB91A9FED034534781492E4B8EEADAE4FDBF11360AC9BBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF30D118A57972FB2DDEA728F66C5349276786ED4F925A359549E804390FA4F31A35D9E4C97941E9B15A468F5258EE6FDEE9589821669FE9947EAF46166138AE30E36A8015DD46D7FC034D55ECCE8C67C6913E6812662D5F2A78A556DA1408BD603BAB4BE5B351B77B77D7EADF59166DF0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVbGoXdS5lirDFAWuffZ9whY=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F36C2815222D52032CFE9FA76EDA5B4B73FA7EE83642BAAA7BF9478A0D2748FCD2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4E00FA01937F043F5CE4FA680B5D534C81A8730F1F8A626DA049FFFDB7839CE9ED4DEBB74AAD3736075E8CDC620400307DFA3B5B87CB89FA02E81BB5A388ADF1297E1A382B336C68D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZqzUGXFpmrHL15Eu8fpKsgQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok

On 7/15/25 21:56, Arseniy Velikanov wrote:
> PM8009 was erroneously added since this device doesn't actually have it.
> It triggers a big critical error at boot, so we're drop it.
>
> Also it looks like the fuel gauge is not connected to the battery,
> it reports nonsense info. Downstream kernel uses pmic fg.
>
> PMIC fuel-gauge driver uses mixed stats about dual-cell battery,
> so I combined it into one.
>
> Fixes: 264beb3cbd0d ("arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree")
>
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>   .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 95 +------------------
>   1 file changed, 5 insertions(+), 90 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
> index 668078ea4f04..b74c3c9b4076 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
> @@ -50,18 +50,12 @@ framebuffer: framebuffer@9c000000 {
>   		};
>   	};
>   
> -	battery_l: battery-l {
> +	battery: battery {
>   		compatible = "simple-battery";
> -		voltage-min-design-microvolt = <3870000>;
> -		energy-full-design-microwatt-hours = <16700000>;
> -		charge-full-design-microamp-hours = <4420000>;
> -	};
> -
> -	battery_r: battery-r {
> -		compatible = "simple-battery";
> -		voltage-min-design-microvolt = <3870000>;
> -		energy-full-design-microwatt-hours = <16700000>;
> -		charge-full-design-microamp-hours = <4420000>;
> +		charge-full-design-microamp-hours = <8840000>;
> +		energy-full-design-microwatt-hours = <34300000>;
> +		voltage-min-design-microvolt = <3400000>;
> +		voltage-max-design-microvolt = <4370000>;
>   	};
>   
>   	bl_vddpos_5p5: bl-vddpos-regulator {
> @@ -406,63 +400,6 @@ vreg_l11c_3p0: ldo11 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   	};
> -
> -	regulators-2 {
> -		compatible = "qcom,pm8009-rpmh-regulators";
Thanks for the patch.
Please remove the extra pm8009.dtsi include too.
> -		qcom,pmic-id = "f";
> -
> -		vdd-s1-supply = <&vph_pwr>;
> -		vdd-s2-supply = <&vreg_bob>;
> -		vdd-l2-supply = <&vreg_s8c_1p35>;
> -		vdd-l5-l6-supply = <&vreg_bob>;
> -		vdd-l7-supply = <&vreg_s4a_1p8>;
> -
> -		vreg_s1f_1p2: smps1 {
> -			regulator-name = "vreg_s1f_1p2";
> -			regulator-min-microvolt = <1200000>;
> -			regulator-max-microvolt = <1300000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -		};
> -
> -		vreg_s2f_0p5: smps2 {
> -			regulator-name = "vreg_s2f_0p5";
> -			regulator-min-microvolt = <512000>;
> -			regulator-max-microvolt = <1100000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -		};
> -
> -		/* L1 is unused. */
> -
> -		vreg_l2f_1p3: ldo2 {
> -			regulator-name = "vreg_l2f_1p3";
> -			regulator-min-microvolt = <1056000>;
> -			regulator-max-microvolt = <1200000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -		};
> -
> -		/* L3 & L4 are unused. */
> -
> -		vreg_l5f_2p8: ldo5 {
> -			regulator-name = "vreg_l5f_2p85";
> -			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3000000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -		};
> -
> -		vreg_l6f_2p8: ldo6 {
> -			regulator-name = "vreg_l6f_2p8";
> -			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3000000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -		};
> -
> -		vreg_l7f_1p8: ldo7 {
> -			regulator-name = "vreg_l7f_1p8";
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> -		};
> -	};
>   };
>   
>   &cdsp {
> @@ -495,17 +432,6 @@ zap-shader {
>   	};
>   };
>   
> -&i2c0 {
> -	clock-frequency = <400000>;
> -	status = "okay";
> -
> -	fuel-gauge@55 {
> -		compatible = "ti,bq27z561";
> -		reg = <0x55>;
> -		monitored-battery = <&battery_r>;
> -	};
> -};
> -
>   &i2c11 {
>   	clock-frequency = <400000>;
>   	status = "okay";
> @@ -523,17 +449,6 @@ backlight: backlight@11 {
>   	};
>   };
>   
> -&i2c13 {
> -	clock-frequency = <400000>;
> -	status = "okay";
> -
> -	fuel-gauge@55 {
> -		compatible = "ti,bq27z561";
> -		reg = <0x55>;
> -		monitored-battery = <&battery_l>;
> -	};
> -};
> -
>   &pcie0 {
>   	status = "okay";
>   };
---
Best wishes
Danila

