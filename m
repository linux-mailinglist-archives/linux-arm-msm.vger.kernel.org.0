Return-Path: <linux-arm-msm+bounces-22371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 713DD904B7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC9712851C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 06:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68473167290;
	Wed, 12 Jun 2024 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="dpiPJP3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp58.i.mail.ru (smtp58.i.mail.ru [95.163.41.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D560113CAA7;
	Wed, 12 Jun 2024 06:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173192; cv=none; b=ZXg5KDw3N4oFS44c+SgvwPpMPC10nHeFf71JH5KeV4j+M2NAljVE22yD82Covd9JCspPVSyzI7Ir9RMoNkRUmHaPSsZnul3qxDl/b/nb9+p+9Ze+v4x+4l2SHpv0GgPBLL4XMZIHza4B9R9w1mmwRxre8EXRLZlQSs0R6g/0EOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173192; c=relaxed/simple;
	bh=3XnFHemwzoffQbBL8ILZ+D+G1+e/Y3bOk7LP6mh8MZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lmEkcQwc9PFlS0ZHgdy7BzLVNPcjiZfkxf4hd3zQjTfqNl+582DNysXGu3DmCYBI8XBWE3inqvYv0SRi2UxRBw6Jto/Gr93AVlRoO/UdVz9Gtf9iy85BT2HgKPfHVlwQFFbzpZOKLrmQNZBmX/49d8USB34OrcfDpXpLG5cQtkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=dpiPJP3H; arc=none smtp.client-ip=95.163.41.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To
	:Cc:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=D3dOaQVwqk4GkOQb1RNDUR9U5BZ6DrIfmfdHyETWOyE=; t=1718173189; x=1718263189; 
	b=dpiPJP3H41OBt5xOk1AZ5YCsgyhNlKovC5G6IYT+zg6gGAf0TEMzj5VhfsdFXrg3sbDO5WXFDgM
	6hSI6Mm4TNIRTI0hIHBquCA/6oGclvFAc5oA3UPHVbVjA4UgEd5JhQS7vZkX8SGQxMaHk3l7y77xu
	OeGzdaRXuWOVC8xayBs=;
Received: by smtp58.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sHHKc-00000007HWt-08LX; Wed, 12 Jun 2024 09:19:39 +0300
Message-ID: <727417e8-781c-435c-8abd-f3dfe6b0e5bb@jiaxyga.com>
Date: Wed, 12 Jun 2024 09:19:35 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Add SM7150 MDSS
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: jonathan@marek.ca, krzk+dt@kernel.org, quic_khsieh@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_rmccann@quicinc.com, sean@poorly.run,
 dmitry.baryshkov@linaro.org, tzimmermann@suse.de, mripard@kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, freedreno@lists.freedesktop.org,
 marijn.suijten@somainline.org, robdclark@gmail.com, conor+dt@kernel.org,
 swboyd@chromium.org, quic_abhinavk@quicinc.com, devicetree@vger.kernel.org,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 danila@jiaxyga.com
References: <20240611223743.113223-1-danila@jiaxyga.com>
 <20240611223743.113223-2-danila@jiaxyga.com>
 <171815244421.3448243.12009673117592867975.robh@kernel.org>
Content-Language: en-US
From: Danila Tikhonov <danila@jiaxyga.com>
In-Reply-To: <171815244421.3448243.12009673117592867975.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp58.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AC8CA0B4439200FA2E41D1825D8172A0E0E393E23BEE614B00894C459B0CD1B93701F1BE02D458FA0884110FD7E9D573E0C26D275431DD20C21EB64246B0F9A252B81C99D67B1670
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7646B74825E00C605EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378D70459436292EC88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89EE4BF3B69F6BE66ADED0A25A7AF3B77439617833B69C6AECC7F00164DA146DAFE8445B8C89999728AA50765F7900637CAEE156C82D3D7D9389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8B861051D4BA689FCF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C4E7D9683544204AFC0837EA9F3D197644AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3F6D1C8D476B9D508BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE73D56AD9F5B48EAD3731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5DC52C108294D8BC45002B1117B3ED696C2EE067D40BD6233886DC9BC01168B20823CB91A9FED034534781492E4B8EEADBEC81E4AEBD6D2BFBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB89CEDACDE7794F3187A3F96CD4411BD88AF9E799152713C812A02B75F5FAA397DB53F182780859704A26A3878DC1330792B0840721B6E26F714D4249A18921BAADE3C488B45354054A6BD6C3A9AE7E002C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj7p5wIdCuWKPDhetPjfSXkA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981056BA5190A4959367FC47A557B39A39B5B2B8F84C2F39F76C9F642B473F2A1192C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

On 6/12/24 03:34, Rob Herring (Arm) wrote:
> On Wed, 12 Jun 2024 01:37:40 +0300, Danila Tikhonov wrote:
>> Document the MDSS hardware found on the Qualcomm SM7150 platform.
>>
>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>> ---
>>   .../display/msm/qcom,sm7150-mdss.yaml         | 460 ++++++++++++++++++
>>   1 file changed, 460 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,sm7150-dispcc.h: No such file or directory
>     25 |         #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
>        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
> make: *** [Makefile:240: __sub-make] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611223743.113223-2-danila@jiaxyga.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>

Yes, this happened because I forgot to add note (same for both dtbindings):
Depends on commit ca3a91063acc (dt-bindings: clock: qcom: Add SM7150 
DISPCC clocks)

I don't think I need to resend series right now. But if it's necessary, 
I will.

---
Best wishes
Danila

