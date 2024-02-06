Return-Path: <linux-arm-msm+bounces-9920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4C084B0B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 10:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D1751C215F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 09:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6008712C81D;
	Tue,  6 Feb 2024 09:03:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0212B177;
	Tue,  6 Feb 2024 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707210200; cv=none; b=BfYdC4S8msZYpzCNPT+qXzBW+nMnH3A0W3ZvbVy/WFIFJEUArEb1N8B+NLP3Gmav7LLjWmWvcAdGyqoYIbOLtVO+GXM/JhVlmCXjLSdmbFVpwFCpLPjBSViaEmK7RkAtcIlpNkREXz3joxGk1K7CIUTqiFM8lzHOC1SO9X6Eg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707210200; c=relaxed/simple;
	bh=woWHR8G0HDq1uY9GTujFTBnGwidFzPPBgYFtgELVM8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nf/8jptmvbR56QNrfonPrvP+Fsg5nRScs+02G1pA1GHAYmhqisqB8daEvvWVOx0KZdCO/ZTYYXfvV25YRhrBPIKRq7bZheatUjLNN5V9Skyb7U3iysY8LtuGWeantooOQ2LHU5HTzB7n3ueLFcf6b8rpJwVodLEy9ihQQOuk5Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D1AC433C7;
	Tue,  6 Feb 2024 09:03:15 +0000 (UTC)
Date: Tue, 6 Feb 2024 14:33:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH v11] bus: mhi: host: Add tracing support
Message-ID: <20240206090312.GB8333@thinkpad>
References: <20240206-ftrace_support-v11-1-3f71dc187544@quicinc.com>
 <20240206062636.GA8333@thinkpad>
 <eded3ffe-882d-9514-9c9a-9c49d3a7a9a6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eded3ffe-882d-9514-9c9a-9c49d3a7a9a6@quicinc.com>

On Tue, Feb 06, 2024 at 12:25:30PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 2/6/2024 11:56 AM, Manivannan Sadhasivam wrote:
> > On Tue, Feb 06, 2024 at 10:02:05AM +0530, Krishna chaitanya chundru wrote:
> > > This change adds ftrace support for following functions which
> > > helps in debugging the issues when there is Channel state & MHI
> > > state change and also when we receive data and control events:
> > > 1. mhi_intvec_mhi_states
> > > 2. mhi_process_data_event_ring
> > > 3. mhi_process_ctrl_ev_ring
> > > 4. mhi_gen_tre
> > > 5. mhi_update_channel_state
> > > 6. mhi_tryset_pm_state
> > > 7. mhi_pm_st_worker
> > > 
> > > Change the implementation of the arrays which has enum to strings mapping
> > > to make it consistent in both trace header file and other files.
> > > 
> > > Where ever the trace events are added, debug messages are removed.
> > > 
> > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > 
> > There are a lot of checkpatch errors. Please fix them and resubmit.
> > 
> > - Mani
> > 
> Hi Mani,
> 
> The errors which is pointing in the checkpatch are false positive, those
> errors are being shown from v2 onwards and kernel test boot is also not
> throwing any errors for it.
> 

Bot will check sparse warnings/errors mostly. But these checkpatch issues can be
fixed easily. If you don't do it now, then someone will send a patch for it
later.

- Mani

> I checked with internal team they said these errors are false positive.
> 
> Thanks & Regards,
> Krishna Chaitanya.
> 
> > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Reviewed-by: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > > ---
> > > Changes in v11:
> > > - Rebased with mhi next.
> > > - Link to v10: https://lore.kernel.org/r/20240131-ftrace_support-v10-1-4349306b8f81@quicinc.com
> > > 
> > > Changes in v10:
> > > - Modified command_start and command_end traces to take string as input to mention correct
> > > - string as suggested by mani
> > > - As sugggested by mani modified the print format from lower format to upper case format.
> > > - Link to v9: https://lore.kernel.org/r/20240105-ftrace_support-v9-1-a2dca64cc6ea@quicinc.com
> > > 
> > > Changes in v9:
> > > - Change the implementations of some array so that the strings to enum mapping
> > > - is same in both trace header and other files as suggested by steve.
> > > - Link to v8: https://lore.kernel.org/r/20231207-ftrace_support-v8-1-7f62d4558555@quicinc.com
> > > 
> > > Changes in v8:
> > > - Pass the structure and derefernce the variables in TP_fast_assign as suggested by steve
> > > - Link to v7: https://lore.kernel.org/r/20231206-ftrace_support-v7-1-aca49a04268b@quicinc.com
> > > 
> > > Changes in v7:
> > > - change log format as pointed by mani.
> > > - Link to v6: https://lore.kernel.org/r/20231204-ftrace_support-v6-1-9b206546dac2@quicinc.com
> > > 
> > > Changes in v6:
> > > - use 'rp' directly as suggested by jeffrey.
> > > - Link to v5: https://lore.kernel.org/r/20231127-ftrace_support-v5-1-eb67daead4f1@quicinc.com
> > > 
> > > Changes in v5:
> > > - Use DECLARE_EVENT_CLASS for multiple events as suggested by steve.
> > > - Instead of converting to u64 to print address, use %px to print the address to avoid
> > > - warnings in some platforms.
> > > - Link to v4: https://lore.kernel.org/r/20231111-ftrace_support-v4-1-c83602399461@quicinc.com
> > > 
> > > Changes in v4:
> > > - Fix compilation issues in previous patch which happended due to rebasing.
> > > - In the defconfig FTRACE config is not enabled due to that the compilation issue is not
> > > - seen in my workspace.
> > > - Link to v3: https://lore.kernel.org/r/20231111-ftrace_support-v3-1-f358d2911a74@quicinc.com
> > > 
> > > Changes in v3:
> > > - move trace header file from include/trace/events to drivers/bus/mhi/host/ so that
> > > - we can include driver header files.
> > > - Use macros directly in the trace events as suggested Jeffrey Hugo.
> > > - Reorder the structure in the events as suggested by steve to avoid holes in the buffer.
> > > - removed the mhi_to_physical function as this can give security issues.
> > > - removed macros to define strings as we can get those from driver headers.
> > > - Link to v2: https://lore.kernel.org/r/20231013-ftrace_support-v2-1-6e893ce010b5@quicinc.com
> > > 
> > > Changes in v2:
> > > - Passing the raw state into the trace event and using  __print_symbolic() as suggested by bjorn.
> > > - Change mhi_pm_st_worker to mhi_pm_st_transition as suggested by bjorn.
> > > - Fixed the kernel test rebot issues.
> > > - Link to v1: https://lore.kernel.org/r/20231005-ftrace_support-v1-1-23a2f394fa49@quicinc.com
> > > ---
> > >   drivers/bus/mhi/common.h        |  38 +++---
> > >   drivers/bus/mhi/host/init.c     |  64 +++++----
> > >   drivers/bus/mhi/host/internal.h |  41 ++++++
> > >   drivers/bus/mhi/host/main.c     |  19 ++-
> > >   drivers/bus/mhi/host/pm.c       |   7 +-
> > >   drivers/bus/mhi/host/trace.h    | 280 ++++++++++++++++++++++++++++++++++++++++
> > >   6 files changed, 384 insertions(+), 65 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> > > index f794b9c8049e..dda340aaed95 100644
> > > --- a/drivers/bus/mhi/common.h
> > > +++ b/drivers/bus/mhi/common.h
> > > @@ -297,30 +297,30 @@ struct mhi_ring_element {
> > >   	__le32 dword[2];
> > >   };
> > > +#define MHI_STATE_LIST				\
> > > +	mhi_state(RESET,	"RESET")	\
> > > +	mhi_state(READY,	"READY")	\
> > > +	mhi_state(M0,		"M0")		\
> > > +	mhi_state(M1,		"M1")		\
> > > +	mhi_state(M2,		"M2")		\
> > > +	mhi_state(M3,		"M3")		\
> > > +	mhi_state(M3_FAST,	"M3_FAST")	\
> > > +	mhi_state(BHI,		"BHI")		\
> > > +	mhi_state_end(SYS_ERR,	"SYS ERROR")
> > > +
> > > +#undef mhi_state
> > > +#undef mhi_state_end
> > > +
> > > +#define mhi_state(a, b)		case MHI_STATE_##a: return b;
> > > +#define mhi_state_end(a, b)	case MHI_STATE_##a: return b;
> > > +
> > >   static inline const char *mhi_state_str(enum mhi_state state)
> > >   {
> > >   	switch (state) {
> > > -	case MHI_STATE_RESET:
> > > -		return "RESET";
> > > -	case MHI_STATE_READY:
> > > -		return "READY";
> > > -	case MHI_STATE_M0:
> > > -		return "M0";
> > > -	case MHI_STATE_M1:
> > > -		return "M1";
> > > -	case MHI_STATE_M2:
> > > -		return "M2";
> > > -	case MHI_STATE_M3:
> > > -		return "M3";
> > > -	case MHI_STATE_M3_FAST:
> > > -		return "M3 FAST";
> > > -	case MHI_STATE_BHI:
> > > -		return "BHI";
> > > -	case MHI_STATE_SYS_ERR:
> > > -		return "SYS ERROR";
> > > +	MHI_STATE_LIST
> > >   	default:
> > >   		return "Unknown state";
> > >   	}
> > > -};
> > > +}
> > >   #endif /* _MHI_COMMON_H */
> > > diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> > > index 6d3b045ab259..944da46e6f11 100644
> > > --- a/drivers/bus/mhi/host/init.c
> > > +++ b/drivers/bus/mhi/host/init.c
> > > @@ -20,51 +20,49 @@
> > >   #include <linux/wait.h>
> > >   #include "internal.h"
> > > +#define CREATE_TRACE_POINTS
> > > +#include "trace.h"
> > > +
> > >   static DEFINE_IDA(mhi_controller_ida);
> > > +#undef mhi_ee
> > > +#undef mhi_ee_end
> > > +
> > > +#define mhi_ee(a, b)		[MHI_EE_##a] = b,
> > > +#define mhi_ee_end(a, b)	[MHI_EE_##a] = b,
> > > +
> > >   const char * const mhi_ee_str[MHI_EE_MAX] = {
> > > -	[MHI_EE_PBL] = "PRIMARY BOOTLOADER",
> > > -	[MHI_EE_SBL] = "SECONDARY BOOTLOADER",
> > > -	[MHI_EE_AMSS] = "MISSION MODE",
> > > -	[MHI_EE_RDDM] = "RAMDUMP DOWNLOAD MODE",
> > > -	[MHI_EE_WFW] = "WLAN FIRMWARE",
> > > -	[MHI_EE_PTHRU] = "PASS THROUGH",
> > > -	[MHI_EE_EDL] = "EMERGENCY DOWNLOAD",
> > > -	[MHI_EE_FP] = "FLASH PROGRAMMER",
> > > -	[MHI_EE_DISABLE_TRANSITION] = "DISABLE",
> > > -	[MHI_EE_NOT_SUPPORTED] = "NOT SUPPORTED",
> > > +	MHI_EE_LIST
> > >   };
> > > +#undef dev_st_trans
> > > +#undef dev_st_trans_end
> > > +
> > > +#define dev_st_trans(a, b)	[DEV_ST_TRANSITION_##a] = b,
> > > +#define dev_st_trans_end(a, b)	[DEV_ST_TRANSITION_##a] = b,
> > > +
> > >   const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
> > > -	[DEV_ST_TRANSITION_PBL] = "PBL",
> > > -	[DEV_ST_TRANSITION_READY] = "READY",
> > > -	[DEV_ST_TRANSITION_SBL] = "SBL",
> > > -	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION MODE",
> > > -	[DEV_ST_TRANSITION_FP] = "FLASH PROGRAMMER",
> > > -	[DEV_ST_TRANSITION_SYS_ERR] = "SYS ERROR",
> > > -	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
> > > +	DEV_ST_TRANSITION_LIST
> > >   };
> > > +#undef ch_state_type
> > > +#undef ch_state_type_end
> > > +
> > > +#define ch_state_type(a, b)	[MHI_CH_STATE_TYPE_##a] = b,
> > > +#define ch_state_type_end(a, b)	[MHI_CH_STATE_TYPE_##a] = b,
> > > +
> > >   const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX] = {
> > > -	[MHI_CH_STATE_TYPE_RESET] = "RESET",
> > > -	[MHI_CH_STATE_TYPE_STOP] = "STOP",
> > > -	[MHI_CH_STATE_TYPE_START] = "START",
> > > +	MHI_CH_STATE_TYPE_LIST
> > >   };
> > > +#undef mhi_pm_state
> > > +#undef mhi_pm_state_end
> > > +
> > > +#define mhi_pm_state(a, b)	[MHI_PM_STATE_##a] = b,
> > > +#define mhi_pm_state_end(a, b)	[MHI_PM_STATE_##a] = b,
> > > +
> > >   static const char * const mhi_pm_state_str[] = {
> > > -	[MHI_PM_STATE_DISABLE] = "DISABLE",
> > > -	[MHI_PM_STATE_POR] = "POWER ON RESET",
> > > -	[MHI_PM_STATE_M0] = "M0",
> > > -	[MHI_PM_STATE_M2] = "M2",
> > > -	[MHI_PM_STATE_M3_ENTER] = "M?->M3",
> > > -	[MHI_PM_STATE_M3] = "M3",
> > > -	[MHI_PM_STATE_M3_EXIT] = "M3->M0",
> > > -	[MHI_PM_STATE_FW_DL_ERR] = "Firmware Download Error",
> > > -	[MHI_PM_STATE_SYS_ERR_DETECT] = "SYS ERROR Detect",
> > > -	[MHI_PM_STATE_SYS_ERR_PROCESS] = "SYS ERROR Process",
> > > -	[MHI_PM_STATE_SYS_ERR_FAIL] = "SYS ERROR Failure",
> > > -	[MHI_PM_STATE_SHUTDOWN_PROCESS] = "SHUTDOWN Process",
> > > -	[MHI_PM_STATE_LD_ERR_FATAL_DETECT] = "Linkdown or Error Fatal Detect",
> > > +	MHI_PM_STATE_LIST
> > >   };
> > >   const char *to_mhi_pm_state_str(u32 state)
> > > diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> > > index 4b6deea17bcd..091244cf17c6 100644
> > > --- a/drivers/bus/mhi/host/internal.h
> > > +++ b/drivers/bus/mhi/host/internal.h
> > > @@ -42,6 +42,11 @@ enum mhi_ch_state_type {
> > >   	MHI_CH_STATE_TYPE_MAX,
> > >   };
> > > +#define MHI_CH_STATE_TYPE_LIST				\
> > > +	ch_state_type(RESET,		"RESET")	\
> > > +	ch_state_type(STOP,		"STOP")		\
> > > +	ch_state_type_end(START,	"START")
> > > +
> > >   extern const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX];
> > >   #define TO_CH_STATE_TYPE_STR(state) (((state) >= MHI_CH_STATE_TYPE_MAX) ? \
> > >   				     "INVALID_STATE" : \
> > > @@ -50,6 +55,18 @@ extern const char * const mhi_ch_state_type_str[MHI_CH_STATE_TYPE_MAX];
> > >   #define MHI_INVALID_BRSTMODE(mode) (mode != MHI_DB_BRST_DISABLE && \
> > >   				    mode != MHI_DB_BRST_ENABLE)
> > > +#define MHI_EE_LIST						\
> > > +	mhi_ee(PBL,			"PRIMARY BOOTLOADER")	\
> > > +	mhi_ee(SBL,			"SECONDARY BOOTLOADER")	\
> > > +	mhi_ee(AMSS,			"MISSION MODE")		\
> > > +	mhi_ee(RDDM,			"RAMDUMP DOWNLOAD MODE")\
> > > +	mhi_ee(WFW,			"WLAN FIRMWARE")	\
> > > +	mhi_ee(PTHRU,			"PASS THROUGH")		\
> > > +	mhi_ee(EDL,			"EMERGENCY DOWNLOAD")	\
> > > +	mhi_ee(FP,			"FLASH PROGRAMMER")	\
> > > +	mhi_ee(DISABLE_TRANSITION,	"DISABLE")		\
> > > +	mhi_ee_end(NOT_SUPPORTED,	"NOT SUPPORTED")
> > > +
> > >   extern const char * const mhi_ee_str[MHI_EE_MAX];
> > >   #define TO_MHI_EXEC_STR(ee) (((ee) >= MHI_EE_MAX) ? \
> > >   			     "INVALID_EE" : mhi_ee_str[ee])
> > > @@ -72,6 +89,15 @@ enum dev_st_transition {
> > >   	DEV_ST_TRANSITION_MAX,
> > >   };
> > > +#define DEV_ST_TRANSITION_LIST					\
> > > +	dev_st_trans(PBL,		"PBL")			\
> > > +	dev_st_trans(READY,		"READY")		\
> > > +	dev_st_trans(SBL,		"SBL")			\
> > > +	dev_st_trans(MISSION_MODE,	"MISSION MODE")		\
> > > +	dev_st_trans(FP,		"FLASH PROGRAMMER")	\
> > > +	dev_st_trans(SYS_ERR,		"SYS ERROR")		\
> > > +	dev_st_trans_end(DISABLE,	"DISABLE")
> > > +
> > >   extern const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX];
> > >   #define TO_DEV_STATE_TRANS_STR(state) (((state) >= DEV_ST_TRANSITION_MAX) ? \
> > >   				"INVALID_STATE" : dev_state_tran_str[state])
> > > @@ -94,6 +120,21 @@ enum mhi_pm_state {
> > >   	MHI_PM_STATE_MAX
> > >   };
> > > +#define MHI_PM_STATE_LIST							\
> > > +	mhi_pm_state(DISABLE,			"DISABLE")			\
> > > +	mhi_pm_state(POR,			"POWER ON RESET")		\
> > > +	mhi_pm_state(M0,			"M0")				\
> > > +	mhi_pm_state(M2,			"M2")				\
> > > +	mhi_pm_state(M3_ENTER,			"M?->M3")			\
> > > +	mhi_pm_state(M3,			"M3")				\
> > > +	mhi_pm_state(M3_EXIT,			"M3->M0")			\
> > > +	mhi_pm_state(FW_DL_ERR,			"Firmware Download Error")	\
> > > +	mhi_pm_state(SYS_ERR_DETECT,		"SYS ERROR Detect")		\
> > > +	mhi_pm_state(SYS_ERR_PROCESS,		"SYS ERROR Process")		\
> > > +	mhi_pm_state(SYS_ERR_FAIL,		"SYS ERROR Failure")		\
> > > +	mhi_pm_state(SHUTDOWN_PROCESS,		"SHUTDOWN Process")		\
> > > +	mhi_pm_state_end(LD_ERR_FATAL_DETECT,	"Linkdown or Error Fatal Detect")
> > > +
> > >   #define MHI_PM_DISABLE					BIT(0)
> > >   #define MHI_PM_POR					BIT(1)
> > >   #define MHI_PM_M0					BIT(2)
> > > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > > index abb561db9ae1..2d38f6005da6 100644
> > > --- a/drivers/bus/mhi/host/main.c
> > > +++ b/drivers/bus/mhi/host/main.c
> > > @@ -15,6 +15,7 @@
> > >   #include <linux/skbuff.h>
> > >   #include <linux/slab.h>
> > >   #include "internal.h"
> > > +#include "trace.h"
> > >   int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
> > >   			      void __iomem *base, u32 offset, u32 *out)
> > > @@ -493,11 +494,8 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
> > >   	state = mhi_get_mhi_state(mhi_cntrl);
> > >   	ee = mhi_get_exec_env(mhi_cntrl);
> > > -	dev_dbg(dev, "local ee: %s state: %s device ee: %s state: %s\n",
> > > -		TO_MHI_EXEC_STR(mhi_cntrl->ee),
> > > -		mhi_state_str(mhi_cntrl->dev_state),
> > > -		TO_MHI_EXEC_STR(ee), mhi_state_str(state));
> > > +	trace_mhi_intvec_states(mhi_cntrl, ee, state);
> > >   	if (state == MHI_STATE_SYS_ERR) {
> > >   		dev_dbg(dev, "System error detected\n");
> > >   		pm_state = mhi_tryset_pm_state(mhi_cntrl,
> > > @@ -838,6 +836,8 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
> > >   	while (dev_rp != local_rp) {
> > >   		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
> > > +		trace_mhi_ctrl_event(mhi_cntrl, local_rp);
> > > +
> > >   		switch (type) {
> > >   		case MHI_PKT_TYPE_BW_REQ_EVENT:
> > >   		{
> > > @@ -1003,6 +1003,8 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
> > >   	while (dev_rp != local_rp && event_quota > 0) {
> > >   		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
> > > +		trace_mhi_data_event(mhi_cntrl, local_rp);
> > > +
> > >   		chan = MHI_TRE_GET_EV_CHID(local_rp);
> > >   		WARN_ON(chan >= mhi_cntrl->max_chan);
> > > @@ -1243,6 +1245,7 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> > >   	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(info->len);
> > >   	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, eot, eob, chain);
> > > +	trace_mhi_gen_tre(mhi_cntrl, mhi_chan, mhi_tre);
> > >   	/* increment WP */
> > >   	mhi_add_ring_element(mhi_cntrl, tre_ring);
> > >   	mhi_add_ring_element(mhi_cntrl, buf_ring);
> > > @@ -1337,9 +1340,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
> > >   	enum mhi_cmd_type cmd = MHI_CMD_NOP;
> > >   	int ret;
> > > -	dev_dbg(dev, "%d: Updating channel state to: %s\n", mhi_chan->chan,
> > > -		TO_CH_STATE_TYPE_STR(to_state));
> > > -
> > > +	trace_mhi_channel_command_start(mhi_cntrl, mhi_chan, to_state, "Updating");
> > >   	switch (to_state) {
> > >   	case MHI_CH_STATE_TYPE_RESET:
> > >   		write_lock_irq(&mhi_chan->lock);
> > > @@ -1406,9 +1407,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
> > >   		write_unlock_irq(&mhi_chan->lock);
> > >   	}
> > > -	dev_dbg(dev, "%d: Channel state change to %s successful\n",
> > > -		mhi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
> > > -
> > > +	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, "Updated");
> > >   exit_channel_update:
> > >   	mhi_cntrl->runtime_put(mhi_cntrl);
> > >   	mhi_device_put(mhi_cntrl->mhi_dev);
> > > diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> > > index d0d033ce9984..8b40d3f01acc 100644
> > > --- a/drivers/bus/mhi/host/pm.c
> > > +++ b/drivers/bus/mhi/host/pm.c
> > > @@ -15,6 +15,7 @@
> > >   #include <linux/slab.h>
> > >   #include <linux/wait.h>
> > >   #include "internal.h"
> > > +#include "trace.h"
> > >   /*
> > >    * Not all MHI state transitions are synchronous. Transitions like Linkdown,
> > > @@ -131,6 +132,7 @@ enum mhi_pm_state __must_check mhi_tryset_pm_state(struct mhi_controller *mhi_cn
> > >   	if (unlikely(!(dev_state_transitions[index].to_states & state)))
> > >   		return cur_state;
> > > +	trace_mhi_tryset_pm_state(mhi_cntrl, state);
> > >   	mhi_cntrl->pm_state = state;
> > >   	return mhi_cntrl->pm_state;
> > >   }
> > > @@ -772,7 +774,6 @@ void mhi_pm_st_worker(struct work_struct *work)
> > >   	struct mhi_controller *mhi_cntrl = container_of(work,
> > >   							struct mhi_controller,
> > >   							st_worker);
> > > -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > >   	spin_lock_irq(&mhi_cntrl->transition_lock);
> > >   	list_splice_tail_init(&mhi_cntrl->transition_list, &head);
> > > @@ -780,8 +781,8 @@ void mhi_pm_st_worker(struct work_struct *work)
> > >   	list_for_each_entry_safe(itr, tmp, &head, node) {
> > >   		list_del(&itr->node);
> > > -		dev_dbg(dev, "Handling state transition: %s\n",
> > > -			TO_DEV_STATE_TRANS_STR(itr->state));
> > > +
> > > +		trace_mhi_pm_st_transition(mhi_cntrl, itr->state);
> > >   		switch (itr->state) {
> > >   		case DEV_ST_TRANSITION_PBL:
> > > diff --git a/drivers/bus/mhi/host/trace.h b/drivers/bus/mhi/host/trace.h
> > > new file mode 100644
> > > index 000000000000..d12a98d44272
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/host/trace.h
> > > @@ -0,0 +1,280 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +
> > > +#undef TRACE_SYSTEM
> > > +#define TRACE_SYSTEM mhi_host
> > > +
> > > +#if !defined(_TRACE_EVENT_MHI_HOST_H) || defined(TRACE_HEADER_MULTI_READ)
> > > +#define _TRACE_EVENT_MHI_HOST_H
> > > +
> > > +#include <linux/tracepoint.h>
> > > +#include <linux/trace_seq.h>
> > > +#include "../common.h"
> > > +#include "internal.h"
> > > +
> > > +#undef mhi_state
> > > +#undef mhi_state_end
> > > +
> > > +#define mhi_state(a, b)		TRACE_DEFINE_ENUM(MHI_STATE_##a);
> > > +#define mhi_state_end(a, b)	TRACE_DEFINE_ENUM(MHI_STATE_##a);
> > > +
> > > +MHI_STATE_LIST
> > > +
> > > +#undef mhi_state
> > > +#undef mhi_state_end
> > > +
> > > +#define mhi_state(a, b)		{ MHI_STATE_##a, b },
> > > +#define mhi_state_end(a, b)	{ MHI_STATE_##a, b }
> > > +
> > > +#undef mhi_pm_state
> > > +#undef mhi_pm_state_end
> > > +
> > > +#define mhi_pm_state(a, b)		TRACE_DEFINE_ENUM(MHI_PM_STATE_##a);
> > > +#define mhi_pm_state_end(a, b)		TRACE_DEFINE_ENUM(MHI_PM_STATE_##a);
> > > +
> > > +MHI_PM_STATE_LIST
> > > +
> > > +#undef mhi_pm_state
> > > +#undef mhi_pm_state_end
> > > +
> > > +#define mhi_pm_state(a, b)		{ MHI_PM_STATE_##a, b },
> > > +#define mhi_pm_state_end(a, b)		{ MHI_PM_STATE_##a, b }
> > > +
> > > +#undef mhi_ee
> > > +#undef mhi_ee_end
> > > +
> > > +#define mhi_ee(a, b)			TRACE_DEFINE_ENUM(MHI_EE_##a);
> > > +#define mhi_ee_end(a, b)		TRACE_DEFINE_ENUM(MHI_EE_##a);
> > > +
> > > +MHI_EE_LIST
> > > +
> > > +#undef mhi_ee
> > > +#undef mhi_ee_end
> > > +
> > > +#define mhi_ee(a, b)			{ MHI_EE_##a, b },
> > > +#define mhi_ee_end(a, b)		{ MHI_EE_##a, b }
> > > +
> > > +#undef ch_state_type
> > > +#undef ch_state_type_end
> > > +
> > > +#define ch_state_type(a, b)		TRACE_DEFINE_ENUM(MHI_CH_STATE_TYPE_##a);
> > > +#define ch_state_type_end(a, b)		TRACE_DEFINE_ENUM(MHI_CH_STATE_TYPE_##a);
> > > +
> > > +MHI_CH_STATE_TYPE_LIST
> > > +
> > > +#undef ch_state_type
> > > +#undef ch_state_type_end
> > > +
> > > +#define ch_state_type(a, b)		{ MHI_CH_STATE_TYPE_##a, b },
> > > +#define ch_state_type_end(a, b)		{ MHI_CH_STATE_TYPE_##a, b }
> > > +
> > > +#undef dev_st_trans
> > > +#undef dev_st_trans_end
> > > +
> > > +#define dev_st_trans(a, b)		TRACE_DEFINE_ENUM(DEV_ST_TRANSITION_##a);
> > > +#define dev_st_trans_end(a, b)		TRACE_DEFINE_ENUM(DEV_ST_TRANSITION_##a);
> > > +
> > > +DEV_ST_TRANSITION_LIST
> > > +
> > > +#undef dev_st_trans
> > > +#undef dev_st_trans_end
> > > +
> > > +#define dev_st_trans(a, b)		{ DEV_ST_TRANSITION_##a, b },
> > > +#define dev_st_trans_end(a, b)		{ DEV_ST_TRANSITION_##a, b }
> > > +
> > > +TRACE_EVENT(mhi_gen_tre,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> > > +		 struct mhi_ring_element *mhi_tre),
> > > +
> > > +	TP_ARGS(mhi_cntrl, mhi_chan, mhi_tre),
> > > +
> > > +	TP_STRUCT__entry(
> > > +		__string(name, mhi_cntrl->mhi_dev->name)
> > > +		__field(int, ch_num)
> > > +		__field(void *, wp)
> > > +		__field(__le64, tre_ptr)
> > > +		__field(__le32, dword0)
> > > +		__field(__le32, dword1)
> > > +	),
> > > +
> > > +	TP_fast_assign(
> > > +		__assign_str(name, mhi_cntrl->mhi_dev->name);
> > > +		__entry->ch_num = mhi_chan->chan;
> > > +		__entry->wp = mhi_tre;
> > > +		__entry->tre_ptr = mhi_tre->ptr;
> > > +		__entry->dword0 = mhi_tre->dword[0];
> > > +		__entry->dword1 = mhi_tre->dword[1];
> > > +	),
> > > +
> > > +	TP_printk("%s: Chan: %d TRE: 0x%p TRE buf: 0x%llx DWORD0: 0x%08x DWORD1: 0x%08x\n",
> > > +		  __get_str(name), __entry->ch_num, __entry->wp, __entry->tre_ptr,
> > > +		  __entry->dword0, __entry->dword1)
> > > +);
> > > +
> > > +TRACE_EVENT(mhi_intvec_states,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, int dev_ee, int dev_state),
> > > +
> > > +	TP_ARGS(mhi_cntrl, dev_ee, dev_state),
> > > +
> > > +	TP_STRUCT__entry(
> > > +		__string(name, mhi_cntrl->mhi_dev->name)
> > > +		__field(int, local_ee)
> > > +		__field(int, state)
> > > +		__field(int, dev_ee)
> > > +		__field(int, dev_state)
> > > +	),
> > > +
> > > +	TP_fast_assign(
> > > +		__assign_str(name, mhi_cntrl->mhi_dev->name);
> > > +		__entry->local_ee = mhi_cntrl->ee;
> > > +		__entry->state = mhi_cntrl->dev_state;
> > > +		__entry->dev_ee = dev_ee;
> > > +		__entry->dev_state = dev_state;
> > > +	),
> > > +
> > > +	TP_printk("%s: Local EE: %s State: %s Device EE: %s Dev State: %s\n",
> > > +		  __get_str(name),
> > > +		  __print_symbolic(__entry->local_ee, MHI_EE_LIST),
> > > +		  __print_symbolic(__entry->state, MHI_STATE_LIST),
> > > +		  __print_symbolic(__entry->dev_ee, MHI_EE_LIST),
> > > +		  __print_symbolic(__entry->dev_state, MHI_STATE_LIST))
> > > +);
> > > +
> > > +TRACE_EVENT(mhi_tryset_pm_state,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, int pm_state),
> > > +
> > > +	TP_ARGS(mhi_cntrl, pm_state),
> > > +
> > > +	TP_STRUCT__entry(
> > > +		__string(name, mhi_cntrl->mhi_dev->name)
> > > +		__field(int, pm_state)
> > > +	),
> > > +
> > > +	TP_fast_assign(
> > > +		__assign_str(name, mhi_cntrl->mhi_dev->name);
> > > +		if (pm_state)
> > > +			pm_state = __fls(pm_state);
> > > +		__entry->pm_state = pm_state;
> > > +	),
> > > +
> > > +	TP_printk("%s: PM state: %s\n", __get_str(name),
> > > +		  __print_symbolic(__entry->pm_state, MHI_PM_STATE_LIST))
> > > +);
> > > +
> > > +DECLARE_EVENT_CLASS(mhi_process_event_ring,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_ring_element *rp),
> > > +
> > > +	TP_ARGS(mhi_cntrl, rp),
> > > +
> > > +	TP_STRUCT__entry(
> > > +		__string(name, mhi_cntrl->mhi_dev->name)
> > > +		__field(__le32, dword0)
> > > +		__field(__le32, dword1)
> > > +		__field(int, state)
> > > +		__field(__le64, ptr)
> > > +		__field(void *, rp)
> > > +	),
> > > +
> > > +	TP_fast_assign(
> > > +		__assign_str(name, mhi_cntrl->mhi_dev->name);
> > > +		__entry->rp = rp;
> > > +		__entry->ptr = rp->ptr;
> > > +		__entry->dword0 = rp->dword[0];
> > > +		__entry->dword1 = rp->dword[1];
> > > +		__entry->state = MHI_TRE_GET_EV_STATE(rp);
> > > +	),
> > > +
> > > +	TP_printk("%s: TRE: 0x%p TRE buf: 0x%llx DWORD0: 0x%08x DWORD1: 0x%08x State: %s\n",
> > > +		  __get_str(name), __entry->rp, __entry->ptr, __entry->dword0,
> > > +		  __entry->dword1, __print_symbolic(__entry->state, MHI_STATE_LIST))
> > > +);
> > > +
> > > +DEFINE_EVENT(mhi_process_event_ring, mhi_data_event,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_ring_element *rp),
> > > +
> > > +	TP_ARGS(mhi_cntrl, rp)
> > > +);
> > > +
> > > +DEFINE_EVENT(mhi_process_event_ring, mhi_ctrl_event,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_ring_element *rp),
> > > +
> > > +	TP_ARGS(mhi_cntrl, rp)
> > > +);
> > > +
> > > +DECLARE_EVENT_CLASS(mhi_update_channel_state,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan, int state,
> > > +		 const char *reason),
> > > +
> > > +	TP_ARGS(mhi_cntrl, mhi_chan, state, reason),
> > > +
> > > +	TP_STRUCT__entry(
> > > +		__string(name, mhi_cntrl->mhi_dev->name)
> > > +		__field(int, ch_num)
> > > +		__field(int, state)
> > > +		__field(const char *, reason)
> > > +	),
> > > +
> > > +	TP_fast_assign(
> > > +		__assign_str(name, mhi_cntrl->mhi_dev->name);
> > > +		__entry->ch_num = mhi_chan->chan;
> > > +		__entry->state = state;
> > > +		__entry->reason = reason;
> > > +	),
> > > +
> > > +	TP_printk("%s: chan%d: %s state to: %s\n",
> > > +		  __get_str(name),  __entry->ch_num, __entry->reason,
> > > +		  __print_symbolic(__entry->state, MHI_CH_STATE_TYPE_LIST))
> > > +);
> > > +
> > > +DEFINE_EVENT(mhi_update_channel_state, mhi_channel_command_start,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan, int state,
> > > +		 const char *reason),
> > > +
> > > +	TP_ARGS(mhi_cntrl, mhi_chan, state, reason)
> > > +);
> > > +
> > > +DEFINE_EVENT(mhi_update_channel_state, mhi_channel_command_end,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan, int state,
> > > +		 const char *reason),
> > > +
> > > +	TP_ARGS(mhi_cntrl, mhi_chan, state, reason)
> > > +);
> > > +
> > > +TRACE_EVENT(mhi_pm_st_transition,
> > > +
> > > +	TP_PROTO(struct mhi_controller *mhi_cntrl, int state),
> > > +
> > > +	TP_ARGS(mhi_cntrl, state),
> > > +
> > > +	TP_STRUCT__entry(
> > > +		__string(name, mhi_cntrl->mhi_dev->name)
> > > +		__field(int, state)
> > > +	),
> > > +
> > > +	TP_fast_assign(
> > > +		__assign_str(name, mhi_cntrl->mhi_dev->name);
> > > +		__entry->state = state;
> > > +	),
> > > +
> > > +	TP_printk("%s: Handling state transition: %s\n", __get_str(name),
> > > +		  __print_symbolic(__entry->state, DEV_ST_TRANSITION_LIST))
> > > +);
> > > +
> > > +#endif
> > > +#undef TRACE_INCLUDE_PATH
> > > +#define TRACE_INCLUDE_PATH ../../drivers/bus/mhi/host
> > > +#undef TRACE_INCLUDE_FILE
> > > +#define TRACE_INCLUDE_FILE trace
> > > +
> > > +#include <trace/define_trace.h>
> > > 
> > > ---
> > > base-commit: ae1d892d518af5c092f2b1f8e6921996c6a95cb3
> > > change-id: 20240206-ftrace_support-8ef0fbecf85e
> > > 
> > > Best regards,
> > > -- 
> > > Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

