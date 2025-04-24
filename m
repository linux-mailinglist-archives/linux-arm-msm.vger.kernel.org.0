Return-Path: <linux-arm-msm+bounces-55367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E106CA9AB07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 12:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DECBA9258C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 10:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1207621FF57;
	Thu, 24 Apr 2025 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWbdLNMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738F3221FB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491885; cv=none; b=P2j026GuYDxrVgYSCI10mZKLk//9VWLrQXL2GT5rZ9zMRj1bwyVGx+65znfWklF9z0oLiJonCnWX8q2XclYXy6Ty//qu5GW0T6+LCVU0q1Hsxu5N+QwWVmzikop4Ebp6apU0Qx0sew8L1dfVPxRACrdDYaJP9b2APu5sJ/zWJbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491885; c=relaxed/simple;
	bh=8Q3FYFOh2kc9wXCZ21vnkbFPYExNHNigPhv+rCGYv5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8Q5mz2nIH3PwE3Hz9f72ZpC2gPLDvfycpoDz0E5GcJy9HGtLMHCv+66B2RNaGmcBca5lCYP/acdUpLg+ehm4C7CxXPz0UHBQK69uTelnV19uIFFBruuWxkeaKzvTTJf6X9baQGOSRAGGI3D6h9PqdGSTlFfCvrqWuJASW/6c8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWbdLNMJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAEbnM010142
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPxC5gR4RA6GtliDWzNm8WFvT9nOrcyxkhsvtHvBT8I=; b=MWbdLNMJbmPjvCjX
	Ln11rG8o0Jsba7zYTQ03ZCXaD6XpYPvq8lB2oCEA6lx7VA0/ZOS1zN7J1qrG5bvC
	ybSQZ2FPdurZBK5H1IB9HU95pzpjj6w042MOzD8Xnf6iP7+27agis8r4E7ZrV1cr
	XMOMspnD3K9btpbxEC4qHnqMMPAfB1Yjm3BrvxcNhksgi2a4p7V6HtEHgRmHaft7
	Vok7UMrhkj3s/x8FVegA7JQHcWdKxg+7N9qMZqh+mWaORB4CMjG1cCIYxJXcZUTm
	3pyJKgkkC3uHbUq1hHaYJ4sCkBOlPmZQODJeMG4yvhTRcgCdC/rWDMlX3an/azx4
	nC+yIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0daym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:51:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d9d8890fso369697685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 03:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491880; x=1746096680;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPxC5gR4RA6GtliDWzNm8WFvT9nOrcyxkhsvtHvBT8I=;
        b=QnrgkdHjF2ytmPShQPDZbOrmSidGLwyifF4U8WGq6kgFofx08TjpK9p51ap3MJSZmn
         TXAH65OqyV7I6pLgMj8mtDaZovf9q1Q82J4qu98GTh2PxNQFFuMIvPZXYTbx0UOem6jq
         qAUIkZhrDFxI/+5EuJsSb73RbK8hTaCa6YWglmvvozn38crPfIObY6nDA7V9UYAw8Jfu
         9T6G2RYDcDwyg2u5hmtWj4Z7lsLm3r9D/CcZbXzcnJd5FD5IHSLlkvZo/Cq5BFsXP/AU
         ISvz/69pEM8cNrfeu110aQubKHidUtS458kOKoUuZqnqJObHKc8K0AjdCqwCo3Q2xBzl
         eopQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEKHPVzaAPIM7o2FWv9HY9z2wax5i1UyhP1KIhDDomu9CYEDhAbNmf5hdh5Z48hDz5UCNzkS3BBs8cm8CF@vger.kernel.org
X-Gm-Message-State: AOJu0YzqUaydYVVOuhYbbS6pbGBMJfTfUXlmr9V1OilQ2nodujUAEuxf
	JtRS7FDRvg72EhtopE6e3jW9V+pDt8ht1M6h2uZVYt9JMGmLrLJnW51rPHCrGQBxjKfC0Wu17et
	zxPpdFpOUx/Kf8T3x/mcitx2Ms9IUk0q0cGexFsPSRPTAw8P+/TomD3SBANfJmzeF
X-Gm-Gg: ASbGncuLAM62A2l7oQn3rA9+DtJa/kt5wxozLXuOBlEwD2lu6ygG0E6Uuz1fDqekHHM
	7Q5R6xeg+YeFiboX6c3ggDOfzXmwd6f+jYr3qP+ECLGaFA81yUnkfx1F4ghr4qxceShUPihPiso
	K7OtSGZSAn6lAGio5MD+QxYxcUpogtm2bT0OICe80jWbDhbIpNIDcxnjMEmEqD9JN6eb5VVBiO/
	jzVZ0kCdfdp7GI4B+2QrMtPrD1YI3sNfgYc86cyeK3KzwHnqsG6irntEZGTdTpW3UdJkqJ8BhIh
	Lwv+Gsv0kLFGNDsRFgrg9IJKCciHbSrueKR4MQDb1k46K7GR0wLM0nbrTeEFT5CURqRc5kURPGs
	=
X-Received: by 2002:a05:620a:414c:b0:7c9:574d:a344 with SMTP id af79cd13be357-7c958659e5amr227775685a.25.1745491880218;
        Thu, 24 Apr 2025 03:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh5n407lbxSXdQd+Or+bg7Zig/W2pF+NxXoVNS7+WNM269eoSPy0vOUVmV16jrZ6SmVs9Qug==
X-Received: by 2002:a05:620a:414c:b0:7c9:574d:a344 with SMTP id af79cd13be357-7c958659e5amr227772185a.25.1745491879846;
        Thu, 24 Apr 2025 03:51:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7dc7sm188726e87.221.2025.04.24.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:51:19 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:51:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH 6/7] platform/chrome: cros_ec_typec: Add support for DP
 altmode via drm_bridge
Message-ID: <npnpujjfonvzhf5c4upgajhx6hu5uqmerewmbqprvl7a3xrqgm@datubwgyucby>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-7-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416000208.3568635-7-swboyd@chromium.org>
X-Proofpoint-GUID: eJ2L-rEB2G1PkfqZ5IqQ3VFEdLtnOCiI
X-Proofpoint-ORIG-GUID: eJ2L-rEB2G1PkfqZ5IqQ3VFEdLtnOCiI
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a17a9 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=37Y-6JeU6fprrkKw-18A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3MiBTYWx0ZWRfX7CUfEGqrnWX+ e23P0F5YvDfLoPjpD0j/RVkAAZ+/oYSLMbXJk1Vya0id3xgWEtQupGNlCZIF9E6e7W1aHV+Wx12 MnvL54cegbyGaXhqXXWsu4+U11VuktlfB6kvLQeF69QqW96g12JUt+zWKLgGiWxY34QVCNkk8Kp
 FMOfOvtYuTWrD9QcEWFJ0aJHmND6xIlbkmJmpYNeFCyDV+9FYa0NMb+SbRXZQQstQhVzy81nI57 9r+DnPKWNkTj7Jy2pI8sZSUT5CDHp1BEhuuaGlGdxub1VhIqbhYyrFSWaJqWbTzAvxyYSSH33Pf g5Qmm/I1c7SJprtMOsYEyR7T3invbiFa0ct6Mj8omXVmlxdSGr/L0Ep7qdyk37S1BjQ5k8RPgPW
 VMlClb9Jmb/hk6l6JO+Fw4VIZ58wFGoTKXUGn3ZTL5Z462hwv/va3YeArUkCU8POVVoeL5wP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240072

On Tue, Apr 15, 2025 at 05:02:06PM -0700, Stephen Boyd wrote:
> On Trogdor platforms, the USB DP altmode is entered and exited by the EC
> depending on if DP altmode is possible and if HPD is asserted for a
> port. Trogdor has two USB-C connectors but the AP only supports one DP
> controller, so the first USB-C connector to assert HPD "wins". The DP
> controller on the AP is fixed to output two lanes DP that goes to an
> analog mux that steers the DP lanes to one of the two USB-C connectors.
> The HPD state in the DP altmode is "captured" by the EC and redriven
> from a GPIO on the EC to the AP's GPIO that is muxed to the DisplayPort
> controller inside the AP SoC. This allows both HPD high/low and HPD IRQ
> to be signaled from the EC as well as making DP altmode possible on
> either USB-C connector except at the same time.
> 
> Add a drm_bridge to the ChromeOS EC driver to represent this analog mux
> on Trogdor and teach the kernel that DP altmode is using this DP
> controller on the AP. When the DT node has a graph binding, we assume
> that we're muxing DP to one of many USB-C connectors and we terminate
> the bridge chain here. In almost all cases we want this bridge to be the
> one that signals HPD because the EC is the one managing HPD and
> redriving the GPIO, except for in the case that the DP altmode driver is
> enabled in which case HPD will be signaled with
> drm_bridge_connector_oob_hotplug_event(). Unfortunately Trogdor EC
> firmwares have a bug where HPD state isn't discoverable properly, so we
> skip signaling HPD in that case if the "no-hpd" property exists in the
> node.
> 
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/platform/chrome/Kconfig         |  1 +
>  drivers/platform/chrome/cros_ec_typec.c | 50 +++++++++++++++++++++++++
>  drivers/platform/chrome/cros_ec_typec.h |  7 ++++
>  3 files changed, 58 insertions(+)
> 
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
> index 1b2f2bd09662..0ed8637b8853 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -247,6 +247,7 @@ config CROS_EC_TYPEC
>  	depends on MFD_CROS_EC_DEV && TYPEC
>  	depends on CROS_USBPD_NOTIFY
>  	depends on USB_ROLE_SWITCH
> +	depends on DRM_BRIDGE
>  	default MFD_CROS_EC_DEV
>  	select CROS_EC_TYPEC_ALTMODES if TYPEC_DP_ALTMODE
>  	select CROS_EC_TYPEC_ALTMODES if TYPEC_TBT_ALTMODE
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 2cbe29f08064..27324cf0c0c6 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -9,6 +9,7 @@
>  #include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_device.h>
> @@ -16,6 +17,8 @@
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_tbt.h>
>  
> +#include <drm/drm_bridge.h>
> +
>  #include "cros_ec_typec.h"
>  #include "cros_typec_vdm.h"
>  #include "cros_typec_altmode.h"
> @@ -337,6 +340,9 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>  	u32 port_num = 0;
>  
>  	nports = device_get_child_node_count(dev);
> +	/* Don't count any 'ports' child node */
> +	if (of_graph_is_present(dev->of_node))
> +		nports--;

Should this be a separate commit?

>  	if (nports == 0) {
>  		dev_err(dev, "No port entries found.\n");
>  		return -ENODEV;
> @@ -350,6 +356,10 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>  	/* DT uses "reg" to specify port number. */
>  	port_prop = dev->of_node ? "reg" : "port-number";
>  	device_for_each_child_node(dev, fwnode) {
> +		/* An OF graph isn't a connector */
> +		if (fwnode_name_eq(fwnode, "ports"))
> +			continue;
> +

... together with this chunk.

>  		if (fwnode_property_read_u32(fwnode, port_prop, &port_num)) {
>  			ret = -EINVAL;
>  			dev_err(dev, "No port-number for port, aborting.\n");
> @@ -417,6 +427,42 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>  	return ret;
>  }
>  
> +static int cros_typec_dp_bridge_attach(struct drm_bridge *bridge,
> +				       enum drm_bridge_attach_flags flags)
> +{
> +	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
> +}
> +
> +static const struct drm_bridge_funcs cros_typec_dp_bridge_funcs = {
> +	.attach	= cros_typec_dp_bridge_attach,
> +};
> +
> +static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
> +{
> +	struct device *dev = typec->dev;
> +	struct cros_typec_dp_bridge *dp_bridge;
> +	struct drm_bridge *bridge;
> +	struct device_node *np = dev->of_node;
> +
> +	/* Not capable of DP altmode switching. Ignore. */
> +	if (!of_graph_is_present(np))
> +		return 0;
> +
> +	dp_bridge = devm_kzalloc(dev, sizeof(*dp_bridge), GFP_KERNEL);
> +	if (!dp_bridge)
> +		return -ENOMEM;
> +	typec->dp_bridge = dp_bridge;
> +
> +	bridge = &dp_bridge->bridge;
> +	bridge->funcs = &cros_typec_dp_bridge_funcs;
> +	bridge->of_node = np;
> +	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
> +	if (!device_property_read_bool(dev, "no-hpd"))
> +		bridge->ops |= DRM_BRIDGE_OP_HPD;
> +
> +	return devm_drm_bridge_add(dev, bridge);

Could you please use aux-hpd-bridge instead?

BTW: what is the usecase for the no-hpd handling here?

> +}
> +
>  static int cros_typec_usb_safe_state(struct cros_typec_port *port)
>  {
>  	int ret;

-- 
With best wishes
Dmitry

