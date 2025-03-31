Return-Path: <linux-arm-msm+bounces-52904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D46BA77097
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 00:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ACB7162391
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 22:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45AB1D516F;
	Mon, 31 Mar 2025 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOBKivb/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106B214A8F
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458446; cv=none; b=BsDNzlriRUOEY9SQag13tLUSJKUaZVJzV2KBXLrzBpJUUeBfEzATiA7mY7+eHEzV3U1DaaWZF35FPL7QBpsodobftEsze3gAPvIKzr5mDNdWc1lvkzyvvpaCIOQMXffsKWGITNfN7QQe8UGMG0xCDQJP6luo2FSga00OZzpe4ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458446; c=relaxed/simple;
	bh=WUWj1AX+EZYIzoBqPQx0J5vNkFJB9J2I0NYo8SVFXaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xn11PZiQkdi+opfA7cxfUgV//C6TrYWPq7QySNKIj6/yP9Fs7KrwG5qZSrmaKz4w9owys9HMtxsj6Ri0pGhk9YL2N+6svCg7entJkp4b2fls05Rxw5USwtksQw9t4CdqMaDtbUlLcWwlCfeISSckOu2TL8coO7+Ujad2d2rmfeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOBKivb/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFD8iN003381
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 22:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mkFZoZXQJzJt0Cg5UOTM27a1
	fl/MrtPgUNj+Jrp+bYg=; b=YOBKivb/vSQMJi59VIMk0WZG2rYeBMWW5n0rV8qc
	OqREB8zPgGOOHTSM4GZGpkBWovRFRnzo8twAgi2oZIGgKN5Gvsd0H/zxgsAvZKBW
	GWFJJJ2z7FChxQJSFSH37TZDgceiKYvRwgNJKinDY2XdW5uYYDPOXkYGdic3NzcD
	54RW8chblSN1CVZMmWo2qratP3c78XePJQRokqSutLepMnkN3DeqxFZuiyuwM8yB
	qOKSo3CYgP/lxSnOU0sUOO85JW3YoXMdvuWcvKtPws3u/qxdRAAuatOYhMn0+jhn
	Ie380S+2Ln9of7KWmBC2wmQ4Oz8+99VnSHwsttQT+5NUqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5bnm5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 22:00:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff605a7a43so13723459a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 15:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458443; x=1744063243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkFZoZXQJzJt0Cg5UOTM27a1fl/MrtPgUNj+Jrp+bYg=;
        b=ijFhHY8zsf1VhgJXY0gyX+85AsBr04PySb98KUqaOZ7Cozvhk/929mGEQN3H4JC/zy
         0D0BOei0+87NB4VPkRi0NNZYp/c+5W5q6kQDvQ61H3fSouY/fydBWi/bVhf7k9u0bCcU
         RSU3rJD7nakEP2SC8H0W2ZMDtf1G2qJiMPj3C1DcnesmdQSHQh5lX1JnZXGLdaC+NtYp
         PAc0xB1s/4O2EETaGNwebhvwd4RpUvVI/KGZOwQq7JdujHbifcUoKNIhph9uVQTM0PRu
         0+4mrfdT7fQH4SMFHof0fK8Rs/LL6QwjM0rKoow+uAbPWh4Lf2QhumLBpwirJ7WFBpwm
         y0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUzfRwnihF7n9dxYGKnq3AXEW/pENpKYk8jwFUhK6LHjgfRSZkJ1Zxzt5/bjUvN9o50c6iaMAzfYrMcLM4Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq5kxfhlzw0JK+tksZpAljCMMxzxPCaxRvHCTsQdL3jozLRG+B
	zbxK+WrnTPwdF2TgsKCLJiVW5CXKEXkLXVpwFO9ska+LugCuWOc+jjkvLEkGHsHBnRb6Y+vLvqh
	87rHqfS9C/3FgDpsnbbBAwmmqphGKmiV2GfdleKj8HIsbU+R458MXRFAdIEo8POie2AuwMgZt9x
	Pt90zcAYjPS97C5m3Svvf3LTLB0JUT2/Ae4GlKvgo=
X-Gm-Gg: ASbGnct4wZruJHXOPUbiZ7f5i3WMT0sgT4NxxQQ9egnhA9O7T8m3MRIOPXTJTM1btH5
	QS8yeMNNO5zy345Zbe7QygrIS5LI1LBlFPkcp2pHK9oRJCt9o2L4IcwSmC8442Gg/rzDvcBfl
X-Received: by 2002:a17:90b:4ed0:b0:2fe:a79e:f56f with SMTP id 98e67ed59e1d1-30531fa2e07mr17238361a91.13.1743458442818;
        Mon, 31 Mar 2025 15:00:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRjxY76/5/UsuzMPvfK4iO1euUPzgYJFxPuu7zecfhm4WiN69/SwrKxiGXZio8ZH7TREkRUUaI7irNgCBpWcU=
X-Received: by 2002:a17:90b:4ed0:b0:2fe:a79e:f56f with SMTP id
 98e67ed59e1d1-30531fa2e07mr17238311a91.13.1743458442457; Mon, 31 Mar 2025
 15:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-1-45d5f2747398@linaro.org>
 <Z-pJP4PMwPo3L3Og@hovoldconsulting.com> <CACr-zFA_oSySRnA2VaSQk2ND_AHeyt3v=RuPTbABPM7SYown6g@mail.gmail.com>
 <b4983b93-97fc-43ed-a41c-a44f90773062@oss.qualcomm.com> <CACr-zFDDPfRXZYUsbMoBASU6O5mBmqiFNFBtZTL9_vbo_7uANg@mail.gmail.com>
In-Reply-To: <CACr-zFDDPfRXZYUsbMoBASU6O5mBmqiFNFBtZTL9_vbo_7uANg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 01:00:31 +0300
X-Gm-Features: AQ5f1JpqhHc7KEz0u200xVRtc-LLhmuNIHxpZh6lPavUuGu8Ac7aioAB8xnQ09Y
Message-ID: <CAO9ioeV9JoED9pvdwJneB1+-=uWW_XZ3Dm0ckQbiv7kfA7usoA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 eDP panel
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: CHMgIuiFuUevNGYr_KL3t7jRWDR6t8NL
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67eb108b cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rRiRvEloSRtx8nxw5TkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CHMgIuiFuUevNGYr_KL3t7jRWDR6t8NL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_10,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310151

On Tue, 1 Apr 2025 at 00:38, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> Hi Dmitry,
>
> On Mon, 31 Mar 2025 at 17:49, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On 31/03/2025 18:39, Christopher Obbard wrote:
> > > Hi Johan,
> > >
> > > On Mon, 31 Mar 2025 at 09:50, Johan Hovold <johan@kernel.org> wrote:
> > >>
> > >> On Thu, Mar 27, 2025 at 04:56:53PM +0000, Christopher Obbard wrote:
> > >>> The eDP panel has an HPD GPIO. Describe it in the device tree
> > >>> for the generic T14s model, as the HPD GPIO property is used in
> > >>> both the OLED and LCD models which inherit this device tree.
> > >>
> > >> AFAICT, this patch is not correct as the hotplug detect signal is
> > >> connected directly to the display controller on (these) Qualcomm SoCs
> > >> and is already handled by its driver.
> > >>
> > >> Describing it as you do here leads to less accurate delays, see commits:
> > >>
> > >>          2327b13d6c47 ("drm/panel-edp: Take advantage of wait_hpd_asserted() in struct drm_dp_aux").
> > >>          3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct drm_dp_aux")
> > >>
> > >> Perhaps you lose some other functionality too.
> > >>
> > >>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > >>> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > >>> ---
> > >>>   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 11 +++++++++++
> > >>>   1 file changed, 11 insertions(+)
> > >>>
> > >>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > >>> index 962fb050c55c4fd33f480a21a8c47a484d0c82b8..46c73f5c039ed982b553636cf8c4237a20ba7687 100644
> > >>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > >>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > >>> @@ -980,8 +980,12 @@ &mdss_dp3 {
> > >>>        aux-bus {
> > >>>                panel: panel {
> > >>>                        compatible = "edp-panel";
> > >>> +                     hpd-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
> > >>>                        power-supply = <&vreg_edp_3p3>;
> > >>>
> > >>> +                     pinctrl-0 = <&edp_hpd_n_default>;
> > >>> +                     pinctrl-names = "default";
> > >>> +
> > >>>                        port {
> > >>>                                edp_panel_in: endpoint {
> > >>>                                        remote-endpoint = <&mdss_dp3_out>;
> > >>> @@ -1286,6 +1290,13 @@ hall_int_n_default: hall-int-n-state {
> > >>>                bias-disable;
> > >>>        };
> > >>>
> > >>> +     edp_hpd_n_default: edp-hpd-n-state {
> > >>> +             pins = "gpio119";
> > >>> +             function = "gpio";
> > >>> +             drive-strength = <2>;
> > >>> +             bias-pull-up;
> > >>> +     };
> > >>
> > >> I checked the firmware configuration for this pin on my T14s, which
> > >> does not match what you have here. Instead the function is set to
> > >> "edp0_hot" which forwards the signal to the display controller which
> > >> already handles the signal on panel power on. (And there is also no
> > >> internal pull up enabled).
> > >>
> > >> We may want to describe this pin configuration somewhere, but that's a
> > >> separate issue.
> > >
> > > Thanks for your review, I will send another version in coming days and
> > > drop this first patch (adding hpd to the T14s DTSI).
> > >
> > > As a consequence I will need to add no-hpd property to the panel node.
> > No, you won't. There is a HPD line and it is routed to the DP controller.
>
> OK, I think I misunderstand what Johan said. After taking some time to
> think about it in more detail:
> - The first commit will be changed so that the hpd GPIO will be added
> to the X1E DP controller instead of the panel. grepping the source for
> dp_hot_plug_det shows me how to do that. This part is clear.
>
> - The panel node in the generic T14s DTSI should not have the
> hpd-gpios property / pinctrl set.
>
> - The panel node should not have the hpd-gpios property / pinctrl set.

LGTM. Use sc8180x-primus as an example

>
> I hope I understand that correctly. I will send a new series in the
> morning unless there is any objection.


-- 
With best wishes
Dmitry

